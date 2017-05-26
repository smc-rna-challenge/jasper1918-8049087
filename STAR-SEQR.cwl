arguments:
- {position: 3, prefix: --star_index, valueFrom: '$(inputs.star_index_dir.listing[0].path)'}
- {position: 3, prefix: -g, valueFrom: $(inputs.star_gtf.basename)}
- {position: 3, prefix: -r, valueFrom: $(inputs.star_fasta.basename)}
baseCommand: [starseqr.py]
class: CommandLineTool
cwlVersion: v1.0
doc: STAR-SEQR Fusion Detection
hints: []
inputs:
- {id: star_index_dir, type: Directory}
- id: fq1
  inputBinding: {position: 1, prefix: '-1'}
  type: File
- id: fq2
  inputBinding: {position: 2, prefix: '-2'}
  type: File
- {id: star_fasta, type: File}
- {id: star_gtf, type: File}
- id: name_prefix
  inputBinding: {position: 3, prefix: -p}
  type: string
- id: worker_threads
  inputBinding: {default: 8, position: 3, prefix: -t}
  type: int
- id: mode
  inputBinding: {default: 1, position: 3, prefix: -m}
  type: int
name: STAR-SEQR.cwl
outputs:
- id: starseqr_bedpe
  outputBinding: {glob: $(inputs.name_prefix + '_STAR-SEQR' + '/' + inputs.name_prefix
      + '_STAR-SEQR_breakpoints.bedpe')}
  type: File
package: file:///opt/tools/EA_DREAM2016_SMCRNA_STARSEQR/STAR-SEQR/cwl/STAR-SEQR.cwl
requirements:
- {class: InlineJavascriptRequirement}
- {class: DockerRequirement, coresMin: 8, dockerPull: 'eagenomics/starseqr:0.3.0',
  ramMin: 50000}
- class: InitialWorkDirRequirement
  listing:
  - {entry: $(inputs.star_gtf), entryname: $(inputs.star_gtf.basename)}
  - {entry: $(inputs.star_fasta), entryname: $(inputs.star_fasta.basename)}
