process MULTIQC {

    publishDir params.outdir, mode: 'copy'

    container 'multiqc/multiqc:v1.32'

    input:
    path multiqc_folder

    output:
    path "multiqc_report.html"

    script:
    """
    multiqc "${multiqc_folder}"
    """

}
