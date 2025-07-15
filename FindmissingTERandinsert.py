def find_residue_gaps_and_insert_ter(pdb_file_path, output_file_path):

    # Analyzes a PDB file to find non-sequential residue numbering gaps
    # and inserts a 'TER' record between them, writing to a new file.

    print(f"Analyzing file: {pdb_file_path}\n")

    previous_residue_number = None
    output_lines = []  # Store lines for the new file

    try:
        with open(pdb_file_path, 'r') as file:
            for line in file:
                if line.startswith(('ATOM', 'HETATM')):
                    try:
                        # Extract the atom serial number and residue sequence number.
                        # We use strip() to remove whitespace and int() to convert to a number.
                        atom_serial = int(line[6:11].strip())
                        current_residue_number = int(line[22:26].strip())

                        if previous_residue_number is not None:
                            # If the residue number jumps by more than 1, it's a gap.
                            if current_residue_number > previous_residue_number + 1:
                                print(f"Gap detected: Inserting TER between residue {previous_residue_number} and {current_residue_number} at atom number {atom_serial}.")
                                # Step 4: Insert the TER line
                                output_lines.append("TER\n")
                        
                        previous_residue_number = current_residue_number

                    except (ValueError, IndexError):
                        print(f"Warning: Could not parse ATOM/HETATM line: {line.strip()}")

                elif line.startswith('TER'):
                    # An existing 'TER' record also indicates a break in the chain.
                    previous_residue_number = None
                
                # Step 5: Add the current line (ATOM, HETATM, TER, or other) to our output list
                output_lines.append(line)

        # After reading the whole file, write the modified content to the new file.
        with open(output_file_path, 'w') as outfile:
            outfile.writelines(output_lines)

        print(f"\nProcessing complete. New file saved as: {output_file_path}")

    except FileNotFoundError:
        print(f"Error: The file '{pdb_file_path}' was not found.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")


# --- Main execution ---
if __name__ == "__main__":
    # Path to your original PDB file
    input_path = "old.pdb" 
    
    # Name for the new PDB file
    output_path = "new.pdb"
    
    find_residue_gaps_and_insert_ter(input_path, output_path)
