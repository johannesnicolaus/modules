def VERSION = "0.0.1"

process CUSTOM_SEPARATEORTHOLOGSR {
    tag "$meta.id"
    label 'process_low'

    // conda and singularity containers here are just placeholders
    conda (params.enable_conda ? "bioconda::luscombeu_oikfunction_r=latest" : null)
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'jnicolaus/luscombeu_oikfunction_r:latest':
        'jnicolaus/luscombeu_oikfunction_r:latest' }"

    input:
    tuple val(meta), path(gff3), path(database)

    output:
    tuple val(meta), path("*/*.fasta"), emit: fasta
    path "versions.yml"           , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    def prefix = task.ext.prefix ?: "${meta.id}"
    """
    mkdir ${prefix}

    separate_orthologs.R \\
        $args \\
        --databasepath $database \\
        --gffdir $gff3 \\
        --outdir ${prefix}

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        luscombeu_oikfunction_r: $VERSION
    END_VERSIONS
    """
}
