## Test Plan

### Content Tests

These tests are performed as part of prototype development and testing to ensure that the measure content for the Validation Measure and for CMS104 is correctly evaluating given known input data.

> NOTE: These tests cover proportion measure calculation only. Other calculation features would need to be tested specifically, including: ratio, continuous-variable, and composite calculation and stratifiers.

1. Test Validation Measure
    1. Test data is present for each data element
        1. Ineligible - data is missing and the validation result indicates it is
        2. Invalid - data is present but invalid for each data element and the validation result provides validation messages
        3. Valid - data is present for each data element
    2. Test measure score is successful for
        1. Ineligible
        2. Initial population
        3. Denominator
        4. Denominator Exclusion
        5. Numerator
        6. Numerator Exclusion
        7. Numerator Exception
2. Test CMS104
    1. Test data is present for each data element
        1. Ineligible - data is missing and the validation result indicates it is
        2. Invalid - data is present but invalid for each data element and the validation result provides validation messages
        3. Valid - data is present for each data element
    2. Test measure score is successful for
        1. Ineligible
        2. Initial population
        3. Denominator
        4. Denominator Exclusion
        5. Numerator
        6. Numerator Exclusion
        7. Numerator Exception

### Integration Tests

These tests are performed as part of prototype development and testing to ensure that the Measure Calculation Tool is performing as expected in the prototype environment with known configuration and input data served through expected server behavior.

1. Test CCN Configuration
    1. Validate the MeasureReport is produced with the configured CCN identifier
2. Test Organization/Facility Configuration
    1. Validate the MeasureReport is produced with the configured reporter Organization, and location extensions for each configured facility
3. Test Validation Measure
    1. Test data is present for each data element
    2. Test missing data produces expected validation messages
    3. Test invalid data produces expected validation messages
    4. Test measure score is successful for each test case (1..7)
4. Test CMS104
    1. Test data is present for each data element
    2. Test missing data produces expected validation messages
    3. Test invalid data produces expected validation messages
    4. Test measure score is successful for each test case (1..7)

### Validation Tests

These tests are performed at an implementing site to ensure that the prototype is installed and configured correctly and that it performs as expected within the site environment.

1. Test Validation Measure Data
    1. MeasureReport has the correct CCN
    2. MeasureReport has the correct reporter Organization
    3. MeasureReport has the correct reported Location(s)
    4. MeasureReport has data for each element
    5. MeasureReport has expected validation messages for missing data
    6. MeasureReport has expected validation messages for invalid data
2. Test Validation Measure Calculation
    1. MeasureReport has expected population count and score for each population test (1..7)
    2. MeasureReport has expected supplemental data
3. Test Validation Measure Submission
    1. Validate submitted MeasureReport has correct
        1. CCN
        2. Organization
        3. Reported location(s)
    2. Validate submitted MeasureReport has expected population count and score for each population (1..7)
    2. Validate submitted MeasureReport has expected data references
    3. Validate all expected data is submitted
    4. Validate no unexpected data is submitted

### Submission Tests

These tests are performed at an implementing site to demonstrate calculation and submission of the CMS104 measure.

1. Test CMS104 Measure Data
    1. MeasureReport has data for each element
    2. MeasureReport has expected validation messages for missing data
    3. MeasureReport has expected validation messages for invalid data
2. Test CMS104 Measure Calculation
    1. MeasureReport has expected population count and score for each population (1..7)
    2. MeasureReport has expected supplemental data
3. Test CMS104 Measure Submission
    1. Validate submitted MeasureReport has expected population count and score for each population (1..7)
    2. Validate submitted MeasureReport has expected data references
    3. Validate all expected data is submitted
    4. Validate no unexpected data is submitted

### Performance Tests

These tests are performed as part of prototype development and testing and provide baseline performance characteristics in a known solution environment.

1. Test Validation Measure Evaluation Performance
    1. Unit Test - 1, 5, 10, 100 Patients
    2. Integration Test - 1, 5, 10, 100 Patients
2. Test CMS104 Measure Evaluation Performance
    1. Unit Test - 1, 5, 10, 100 Patients
    2. Integration Test - 1, 5, 10, 100 Patients