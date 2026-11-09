


rule process_data:
    input:
        "data/raw/{session}/data1.csv",
        "data/raw/{session}/eeg.eeg",
        "data/raw/{session}/subject.xlsx",
    output:
        "data/processed/{session}/data.h5"
    shell:
        "uv run scripts/analyze_a.py {inputs} {output[1]}"



rule make_data_for_jose:
    input:
        "data/processed/session1/data.h5",
        "data/processed/session12/data.h5"
    output:
        "data/final/data_for_jose.csv"
    script:
        "scripts/make_jose.py"


