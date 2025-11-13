This is a nextflow wrapper for RiboTIE - part of [TRISTAN](https://github.com/TRISTAN-ORF/TRISTAN) package.

Prerequisites:
- docker or singularity
- nextflow executable
- gpu

Before running:

- `mkdir -p input_folder` and symlink your fasta, gtf and transcriptome bam files to it
- modify the `ribotie_template.yml` with the paths to those files
- modify nextflow.config to account for your settings (current one assumes slurm scheduler and HPC with singularity/apptainer)

RiboTIE output will be written to the input_folder and it contains:
- *.h5 – parsed data from samples listed in yml
- models/ – a folder with model checkpoints
- .csv, .gtf and .npy result files as well as multiqc report

`.npy` files contain full results, and `.csv` / `.gtf` files are produced by filtering the `.npy` file. You can change filtering parameters from defaults and re-generate `.csv` and `.gtf` by using `--results` flag, for example, to use all start codons and not only ATG you can run: `ribotie ribotie_template.yml --results --start_codons ".*"`
