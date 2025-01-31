## OPEN THE TERMINAL, GIT BASH OR POWERSHELL

## LOG INTO THE HPC
- SSH into the HPC:
  ```bash
  ssh your-psc-username@bridges2.psc.edu
  ```
- When prompted, type your password. You will not see any characters appear on the screen as you type (not even * symbols), but your input is still being recorded. Press Enter when done.

## GO TO PERSONAL STORAGE DIRECTORY
- Navigate to your personal storage directory:
  ```bash
  cd /ocean/projects/agr250001p/your-psc-username
  ```

## MAKE SURE YOU HAVE DOWNLOADED THE SUBJECT FILE -- THE HUMAN GENOME
- List your directory contents (`ls`). You should have `GCF_000001405.40_GRCh38.p14_genomic.fna.gz` if you followed the instructions in class. Some of you should also have the partial `SRR741411_2.fastq.gz, we will ignore this file from now on.
  ```bash
  ls
  ```
  Expected output:
  ```
  GCF_000001405.40_GRCh38.p14_genomic.fna.gz
  SRR741411_2.fastq.gz
  ```
- **(OPTIONAL)** If you do not have the human genome file in your directory, download it using `wget`:
  ```bash
  wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/405/GCF_000001405.40_GRCh38.p14/GCF_000001405.40_GRCh38.p14_genomic.fna.gz
  ```
- List the directory again to confirm the download:
  ```bash
  ls
  ```
  Expected output:
  ```
  GCF_000001405.40_GRCh38.p14_genomic.fna.gz
  ```
- Decompress the file:
  ```bash
  gunzip GCF_000001405.40_GRCh38.p14_genomic.fna.gz
  ```
- List the directory to confirm you now have the uncompressed file:
  ```bash
  ls
  ```
  Expected output:
  ```
  GCF_000001405.40_GRCh38.p14_genomic.fna
  ```

## MOVE THE QUERY FILE FROM THE SHARED DIRECTORY TO YOUR PERSONAL STORAGE FOLDER
- Copy the unknown query DNA file to your directory. You were assigned one of five unknown files labeled `unk1 - unk5`:
  ```bash
  cp ../shared/week-3-data/human-genome/your-unk-file.fasta .
  ```
- List your directory contents to confirm the file was copied successfully:
  ```bash
  ls
  ```
  Expected output:
  ```
  GCF_000001405.40_GRCh38.p14_genomic.fna
  your-unk.fasta
  ```

## IT IS TIME TO BLAST
### Load the required software
- Load the BLAST software:
  ```bash
  module load BLAST
  ```
### Build a BLAST Database
- Use the decompressed human genome file to create a local database:
  ```bash
  makeblastdb -in GCF_000001405.40_GRCh38.p14_genomic.fna -dbtype nucl -out human_genome_db
  ```
- Confirm that the database files were created:
  ```bash
  ls
  ```
  Expected output:
  ```
  GCF_000001405.40_GRCh38.p14_genomic.fna
  your-unk.fasta
  human_genome_db.nhr
  human_genome_db.nin
  human_genome_db.ndb
  human_genome_db.not
  human_genome_db.nsq
  human_genome_db.ntf
  human_genome_db.nto
  ```

## Run the BLAST Search

Execute the BLAST search using the query sequence and the human genome database:

```bash
blastn -query your-unk.fasta -db human_genome_db -out results.txt -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore stitle"
```

### This command:
- Takes the query file (`unk.fasta`) – replace this with your assigned unknown file name.
- Creates a file called `results.txt` containing the BLAST results.
- Uses output format #6, which provides a tab-separated table with the following headers:

| **qseqid**  | **sseqid**  | **pident**  | **length**  | **mismatch**  | **gapopen**  | **qstart**  | **qend**  | **sstart**  | **send**  | **evalue**  | **bitscore**  | **stitle**  |
|-------------|------------|-------------|-------------|---------------|--------------|-------------|------------|-------------|------------|------------|------------|---------|
| Query sequence ID (your unknown sequence filename)  | Subject sequence ID from the database (matching reference sequence) | Percentage of identical matches between the query and subject | Length of the alignment | Number of mismatched bases in the alignment | Number of gap openings in the alignment | Start position of the query sequence in the alignment | End position of the query sequence in the alignment | Start position of the subject (reference genome) sequence in the alignment | End position of the subject sequence in the alignment | Expectation value (statistical significance of the match, lower is better) | Score representing the alignment quality (higher is better) | Description of the matching reference sequence |

- Your output will likely contain **multiple hits** because you are blasting against the entire genome. If your query is a coding sequence, **each exon will likely have a hit**.
- The results file is tab-separated, meaning each row represents a single hit, and when viewed in the terminal, it will not appear as a nicely formatted table but as a list of tab-separated values.

- **Use the first hit** to fill in the BLAST Analysis Handout.

### **Submit Your Work**
- Complete the **BLAST Analysis Handout** parts 1 and 2 based on your results.
- Submit your handout to the **weekly homework dropbox in Canvas**.

