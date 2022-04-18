#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { PHAST_PHYLOP } from '../../../../modules/phast/phylop/main.nf'

workflow test_phast_phylop {
    
    input = [
        [ id:'test' ], // meta map
        file(params.test_data['sarscov2']['genome']['informative_sites_mfa'], checkIfExists: true),
        file(params.test_data['sarscov2']['genome']['informative_sites_mod'], checkIfExists: true)
    ]

    PHAST_PHYLOP ( input )
}
