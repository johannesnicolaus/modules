#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { CUSTOM_PREPROCESSINGR } from '../../../../modules/custom/preprocessingr/main.nf'

workflow test_custom_preprocessingr {
    
    input = [
        [ id:'OKI2018.I69' ], // meta map
        file(params.test_data['OKI2018.I69']['annotation']['genome_anno_gtf'], checkIfExists: true)
    ]

    CUSTOM_PREPROCESSINGR ( input )
}
