process TRISTAN_DATA {
    
    tag "DATA_PARSING"
    publishDir params.outdir, mode: 'copy'
    label 'cpu'

    container 'crc1678inf/transcript_transformer:v1.0.1'

    input:
    path ribotie_config
    //path gtf
    //path fasta
    //path reads
    path data_folder

    output:
    path "${data_folder}/*.h5", emit: h5

    script:
    """
    ribotie "${ribotie_config}" --data
    """
}


process RIBOTIE {

    tag "INFERENCE"
    publishDir params.outdir, mode: 'copy'
    label 'gpu'

    container 'crc1678inf/transcript_transformer:v1.0.1'

    input:
    path ribotie_config
    path h5_file
    path data_folder

    output:
    path "${data_folder}/*.npy"
    path "${data_folder}/*.csv"
    path "${data_folder}/multiqc"

    script:
    """
    ribotie "${ribotie_config}" --num_workers 1
    """

}
