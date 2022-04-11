process CLUSTALO_CLUSTALO {
    tag "$meta.id"
    label 'process_medium'
    conda (params.enable_conda ? "bioconda::clustalo=1.2.4" : null)
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/clustalo:1.2.4--h87f3376_5':
        'quay.io/biocontainers/clustalo:1.2.4--h1b792b2_4' }"

    input:
    tuple val(meta), path(fasta)

    output:
    tuple val(meta), path("*.mfa.gz"), emit: fasta
    path "versions.yml"                      , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    def prefix = task.ext.prefix ?: "${meta.id}"
    
    """
    clustalo \\
        $args \\
        --threads=$task.cpus \\
        --auto \\
        --in $fasta \\
        | gzip --no-name > ${prefix}.mfa.gz

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        clustalo: \$(clustalo --version 2>&1)
    END_VERSIONS
    """
}
