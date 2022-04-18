#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { PHAST_PHYLOFIT } from '../../../../modules/phast/phylofit/main.nf'

workflow test_phast_phylofit {
    input = [
        [ id:'test' ], // meta map
        file(params.test_data['sarscov2']['genome']['informative_sites_mfa'], checkIfExists: true),
        file(params.test_data['sarscov2']['genome']['informative_sites_tree'], checkIfExists: true)
    ]

    PHAST_PHYLOFIT ( input )
}