baseCommand: [tar, xvzf]
class: CommandLineTool
cwlVersion: v1.0
doc: 'command line: tar'
hints: []
inputs:
- id: index_name
  inputBinding: {position: 1}
  type: File
name: tar.cwl
outputs:
- id: output
  outputBinding: {glob: .}
  type: Directory
package: file:///opt/tools/EA_DREAM2016_SMCRNA_STARSEQR/STAR-SEQR/cwl/tar.cwl
