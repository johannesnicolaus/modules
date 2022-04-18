#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { PHAST_PHASTCONS } from '../../../../modules/phast/phastcons/main.nf'

workflow test_phast_phastcons {
    
    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['sarscov2']['genome']['informative_sites_mfa'], checkIfExists: true),
        file(params.test_data['sarscov2']['genome']['informative_sites_mod'], checkIfExists: true)
    ]

    PHAST_PHASTCONS ( input )
}
