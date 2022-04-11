#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { CLUSTALO_CLUSTALO } from '../../../../modules/clustalo/clustalo/main.nf'

workflow test_clustalo_clustalo {
    
    input = [
        [ id:'test' ], // meta map
        file(params.test_data['sarscov2']['genome']['informative_sites_fas'], checkIfExists: true)
    ]

    CLUSTALO_CLUSTALO ( input )
}
