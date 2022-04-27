#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { CUSTOM_SEPARATEORTHOLOGSR } from '../../../../modules/custom/separatepromotersr/main.nf'

workflow test_custom_separateorthologsr {
    
    input = [
        [ id:'test' ], // meta map
        file(params.test_data['OKI2018.I69']['annotation']['genome_anno_gtf'], checkIfExists: true)
    ]

    CUSTOM_SEPARATEORTHOLOGSR ( input )
}
