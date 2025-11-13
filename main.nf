include { TRISTAN_DATA } from './modules/tristan/main.nf'
include { RIBOTIE } from './modules/tristan/main.nf'

workflow {
    input_ch = channel.fromPath(params.ribotie_config)
    TRISTAN_DATA(input_ch, params.data_folder)
    RIBOTIE(input_ch, TRISTAN_DATA.out.h5, params.data_folder)
}
