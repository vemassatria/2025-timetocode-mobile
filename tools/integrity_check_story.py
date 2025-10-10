import json
import sys
import os

def validate_story_data(file_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
    except FileNotFoundError:
        print(f"ERROR: File tidak ditemukan di '{file_path}'")
        return False
    except json.JSONDecodeError as e:
        print(f"ERROR: File JSON tidak valid. Cek struktur di dekat baris {e.lineno}, kolom {e.colno}.")
        return False

    if 'levels' not in data:
        print("ERROR: Key 'levels' tidak ditemukan di root JSON.")
        return False
    
    total_error = 0
    
    for level in data.get('levels', []):
        level_id = f"Level {level.get('level', '?')}"
        predialog_ids = set()
        dialog_ids = set()
        question_ids = set()
        draganddrop_ids = set()
        level_references = []

        start_id = level.get('start')
        typeStart_id = level.get('typeStart')
        level_references.append(
            {
                'target_id': start_id, 
                'type': typeStart_id, 
                'context': f"{level_id} -> start"
            }
        )

        for preDialog in level.get('preDialog', []):
            if 'id' in preDialog:
                predialog_ids.add(preDialog['id'])
            if 'next' in preDialog:
                level_references.append(
                        {
                            'target_id': preDialog['next'], 
                            'type': preDialog['nextType'], 
                            'context': f"{level_id} -> preDialog -> id: {preDialog['id']}"
                        }
                    )
                
        for dialog in level.get('dialogs', []):
            if 'id' in dialog:
                dialog_ids.add(dialog['id'])
            source_context = f"{level_id} -> dialogs -> id: {dialog['id']}"
            if dialog.get('next'):
                level_references.append(
                    {
                        'target_id': dialog['next'], 
                        'type': dialog.get('nextType', '?'), 
                        'context': source_context
                    }
                )
            if dialog.get('branch'):
                for choice in dialog['branch'].get('choices', []):
                    if 'next' in choice:
                        level_references.append(
                            {
                                'target_id': choice['next'], 
                                'type': choice.get('nextType', '?'), 
                                'context': f"{source_context} -> branch"
                            }
                        )

        minigame = level.get('minigame', {})
        for question in minigame.get('questions', []):
            if 'id' in question:
                question_ids.add(question['id'])
            for choice in question.get('choices', []):
                if 'next' in choice:
                    level_references.append(
                        {
                            'target_id': choice['next'], 
                            'type': choice.get('nextType', '?'), 
                            'context': f"{level_id} -> minigame -> questions -> id: {question['id']}"
                        }
                    )

        for draganddrop in minigame.get('dragAndDrop', []):
            if 'id' in draganddrop:
                draganddrop_ids.add(draganddrop['id'])
            
            next_ids = draganddrop.get('next', [])
            nextType_ids = draganddrop.get('nextType', [])

            for next, nextType in zip(next_ids, nextType_ids):
                level_references.append(
                    {
                        'target_id': next, 
                        'type': nextType, 
                        'context': f"{level_id} -> minigame -> dragAndDrop -> id: {draganddrop['id']}"
                    }
                )

        for ref in level_references:
            target_id = ref['target_id']
            target_type = ref['type']
            context = ref['context']

            if target_type == 'preDialog':
                if target_id not in predialog_ids:
                    print(f"ERROR: Referensi 'next' tidak valid di {context}. ID '{target_id}' tidak ditemukan di preDialog.")
                    total_error += 1
            elif target_type == 'dialog':
                if target_id not in dialog_ids:
                    print(f"ERROR: Referensi 'next' tidak valid di {context}. ID '{target_id}' tidak ditemukan di dialogs.")
                    total_error += 1
            elif target_type == 'soal':
                if target_id not in question_ids:
                    print(f"ERROR: Referensi 'next' tidak valid di {context}. ID '{target_id}' tidak ditemukan di questions.")
                    total_error += 1
            elif target_type == 'dragAndDrop':
                if target_id not in draganddrop_ids:
                    print(f"ERROR: Referensi 'next' tidak valid di {context}. ID '{target_id}' tidak ditemukan di dragAndDrop.")
                    total_error += 1
            else:
                print(f"WARNING: Tipe referensi 'nextType' tidak dikenal ('{target_type}') di {context}.")

    if total_error == 0:
        print("\nValidasi integritas referensial berhasil! Semua referensi 'next' valid.")
        return True
    else:
        print(f"\nDitemukan {total_error} error integritas referensial.")
        return False


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Penggunaan: python integrity_check_story.py <path_ke_file_json>")
        sys.exit(1)
        
    file_to_check = sys.argv[1]
    
    if not os.path.exists(file_to_check):
        print(f"ERROR: Path file tidak valid: '{file_to_check}'")
        sys.exit(1)

    is_valid = validate_story_data(file_to_check)
    
    if not is_valid:
        sys.exit(1)