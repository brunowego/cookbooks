# Google Gemini OCR

## Issues

### TBD

```log
[OCR API] Processing file: boeing-complete.pdf (application/pdf) with models: [ 'Google/gemini-2.0-flash-exp' ]
[OCR API] Starting Google processing...

<--- Last few GCs --->

[11746:0x148008000]    85269 ms: Scavenge (interleaved) 512.9 (553.0) -> 512.9 (553.0) MB, pooled: 4 MB, 33.88 / 0.00 ms  (average mu = 0.968, current mu = 0.984) allocation failure;
[11746:0x148008000]    85677 ms: Mark-Compact 896.9 (937.0) -> 710.8 (750.9) MB, pooled: 4 MB, 202.42 / 0.04 ms  (+ 0.0 ms in 0 steps since start of marking, biggest step 0.0 ms, walltime since start of marking 1175 ms) (average mu = 0.898, current mu = 0

<--- JS stacktrace --->

FATAL ERROR: invalid table size Allocation failed - JavaScript heap out of memory
----- Native stack trace -----
```

<!--
https://ai.google.dev/gemini-api/docs/files
-->
