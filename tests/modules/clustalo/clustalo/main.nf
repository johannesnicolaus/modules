#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { CLUSTALO_CLUSTALO } from '../../../../modules/clustalo/clustalo/main.nf'

workflow test_clustalo_clustalo {
    
    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['sarscov2']['illumina']['test_paired_end_bam'], checkIfExists: true)
    ]

    CLUSTALO_CLUSTALO ( input )
}
