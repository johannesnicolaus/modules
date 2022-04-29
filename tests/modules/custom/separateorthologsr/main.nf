#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { CUSTOM_SEPARATEORTHOLOGSR } from '../../../../modules/custom/separateorthologsr/main.nf'

workflow test_custom_separateorthologsr {
    
    input = [
        [ id:'test' ],
        [ file(params.test_data['OKI2018.I69']['orthologs']['ortho_N19_sampled_tsv'], checkIfExists: true)],
        [ file(params.test_data['OKI2018.I69']['promoters']['test_promoters_gff3'], checkIfExists: true), 
        file(params.test_data['OSKA2016v1.9']['promoters']['test_promoters_gff3'], checkIfExists: true) ]
    ]

    CUSTOM_SEPARATEORTHOLOGSR ( input )
}
