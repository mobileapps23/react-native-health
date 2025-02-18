//
//  RCTAppleHealthKit+TypesAndPermissions.m
//  RCTAppleHealthKit
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "RCTAppleHealthKit+TypesAndPermissions.h"
#import "RCTAppleHealthKit+Utils.h"

@implementation RCTAppleHealthKit (TypesAndPermissions)

#pragma mark - HealthKit Permissions

- (nullable HKObjectType *)getReadPermFromText:(nonnull NSString*)key {
    UIDevice *deviceInfo = [UIDevice currentDevice];
    float systemVersion = deviceInfo.systemVersion.floatValue;

    // Characteristic Identifiers
    if ([@"Height" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight];
    } else if ([@"Weight" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
    } else if ([@"DateOfBirth" isEqualToString: key]) {
        return [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierDateOfBirth];
    } else if ([@"BiologicalSex" isEqualToString: key]) {
        return [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierBiologicalSex];
    } else if ([@"BloodType" isEqualToString: key]) {
        return [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierBloodType];
    } else if ([@"PeakFlow" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierPeakExpiratoryFlowRate];
    } else if ([@"WaistCircumference" isEqualToString: key] && systemVersion >= 11.0) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierWaistCircumference];
    }

    // Body Measurements
    if ([@"BodyMass" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
    } else if ([@"BodyFatPercentage" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyFatPercentage];
    } else if ([@"BodyMassIndex" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMassIndex];
    } else if ([@"LeanBodyMass" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierLeanBodyMass];
    }

    // Hearing Identifiers
    if (@available(iOS 13.0, *)) {
        if ([@"EnvironmentalAudioExposure" isEqualToString:key]) {
            return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierEnvironmentalAudioExposure];
        } else if ([@"HeadphoneAudioExposure" isEqualToString:key]) {
            return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeadphoneAudioExposure];
        }
    }

    // Fitness Identifiers
    if ([@"Steps" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    } else if ([@"StepCount" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    } else if ([@"DistanceWalkingRunning" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning];
    } else if ([@"RunningSpeed" isEqualToString: key]) {
        if (@available(iOS 16.0, *)) {
            return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRunningSpeed];
        } else {
            return nil;
        }
    } else if ([@"DistanceCycling" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceCycling];
    } else if ([@"DistanceSwimming" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceSwimming];
    } else if ([@"BasalEnergyBurned" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBasalEnergyBurned];
    } else if ([@"ActiveEnergyBurned" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];
    } else if ([@"FlightsClimbed" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierFlightsClimbed];
    } else if ([@"NikeFuel" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierNikeFuel];
    } else if ([@"AppleExerciseTime" isEqualToString: key] && systemVersion >= 9.3) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierAppleExerciseTime];
    } else if ([@"AppleStandHour" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKCategoryTypeIdentifierAppleStandHour];
    } else if ([@"RunningPower" isEqualToString:key]) {
        if (@available(iOS 16.0, *)) {
            return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRunningPower];
        } else {
            return nil;
        }
    } else if ([@"RunningStrideLength" isEqualToString:key]) {
        if (@available(iOS 16.0, *)) {
            return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRunningStrideLength];
        } else {
            return nil;
        }
    } else if ([@"RunningVerticalOscillation" isEqualToString:key]) {
        if (@available(iOS 16.0, *)) {
            return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRunningVerticalOscillation];
        } else {
            return nil;
        }
    } else if ([@"RunningGroundContactTime" isEqualToString:key]) {
        if (@available(iOS 16.0, *)) {
            return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRunningGroundContactTime];
        } else {
            return nil;
        }
    }
    if (@available(iOS 13.0, *)) {
        if ([@"AppleStandTime" isEqualToString: key]) {
            return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierAppleStandTime];
        }
    }
    if (@available(iOS 14.5, *)) {
        if ([@"AppleMoveTime" isEqualToString: key]) {
            return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierAppleMoveTime];
        }
    }

    // Symptoms
    if (@available(iOS 13.6, *)) {
        if ([@"AbdominalCramps" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierAbdominalCramps];
        } else if ([@"Bloating" isEqualToString: key]){
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierBloating];
        } else if ([@"Constipation" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierConstipation];
        } else if ([@"Diarrhea" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierDiarrhea];
        } else if ([@"Heartburn" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierHeartburn];
        } else if ([@"Nausea" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierNausea];
        } else if ([@"Vomiting" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierVomiting];
        } else if ([@"AppetiteChanges" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierAppetiteChanges];
        } else if ([@"Chills" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierChills];
        } else if ([@"Dizziness" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierDizziness];
        } else if ([@"Fainting" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierFainting];
        } else if ([@"Fatigue" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierFatigue];
        } else if ([@"Fever" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierFever];
        } else if ([@"GeneralizedBodyAche" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierGeneralizedBodyAche];
        } else if ([@"HotFlashes" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierHotFlashes];
        } else if ([@"ChestTightnessOrPain" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierChestTightnessOrPain];
        } else if ([@"Coughing" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierCoughing];
        } else if ([@"RapidPoundingOrFlutteringHeartbeat" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierRapidPoundingOrFlutteringHeartbeat];
        } else if ([@"ShortnessOfBreath" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierShortnessOfBreath];
        } else if ([@"SkippedHeartbeat" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierSkippedHeartbeat];
        } else if ([@"Wheezing" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierWheezing];
        } else if ([@"LowerBackPain" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierLowerBackPain];
        } else if ([@"Headache" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierHeadache];
        } else if ([@"MoodChanges" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierMoodChanges];
        } else if ([@"LossOfSmell" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierLossOfSmell];
        } else if ([@"LossOfTaste" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierLossOfTaste];
        } else if ([@"RunnyNose" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierRunnyNose];
        } else if ([@"SoreThroat" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierSoreThroat];
        } else if ([@"SinusCongestion" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierSinusCongestion];
        } else if ([@"BreastPain" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierBreastPain];
        } else if ([@"PelvicPain" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierPelvicPain];
        } else if ([@"Acne" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierAcne];
        } else if ([@"SleepChanges" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierSleepChanges];
        }
    }
    if (@available(iOS 14.0, *)) {
        if ([@"MemoryLapse" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierMemoryLapse];
        } else if ([@"VaginalDryness" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierVaginalDryness];
        } else if ([@"DrySkin" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierDrySkin];
        } else if ([@"HairLoss" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierHairLoss];
        } else if ([@"NightSweats" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierNightSweats];
        } else if ([@"BladderIncontinence" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierBladderIncontinence];
        }
    }


    // Nutrition Identifiers
    if ([@"Biotin" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryBiotin];
    } else if ([@"Caffeine" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCaffeine];
    } else if ([@"Calcium" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCalcium];
    } else if ([@"Carbohydrates" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCarbohydrates];
    } else if ([@"Chloride" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryChloride];
    } else if ([@"Cholesterol" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCholesterol];
    } else if ([@"Chromium" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryChromium];
    } else if ([@"Copper" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCopper];
    } else if ([@"EnergyConsumed" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryEnergyConsumed];
    } else if ([@"FatMonounsaturated" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatMonounsaturated];
    } else if ([@"FatPolyunsaturated" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatPolyunsaturated];
    } else if ([@"FatSaturated" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatSaturated];
    } else if ([@"FatTotal" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatTotal];
    } else if ([@"Fiber" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFiber];
    } else if ([@"Folate" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFolate];
    } else if ([@"Iodine" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryIodine];
    } else if ([@"Iron" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryIron];
    } else if ([@"Magnesium" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryMagnesium];
    } else if ([@"Manganese" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryManganese];
    } else if ([@"Molybdenum" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryMolybdenum];
    } else if ([@"Niacin" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryNiacin];
    } else if ([@"PantothenicAcid" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPantothenicAcid];
    } else if ([@"Phosphorus" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPhosphorus];
    } else if ([@"Potassium" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPotassium];
    } else if ([@"Protein" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryProtein];
    } else if ([@"Riboflavin" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryRiboflavin];
    } else if ([@"Selenium" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySelenium];
    } else if ([@"Sodium" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySodium];
    } else if ([@"Sugar" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySugar];
    } else if ([@"Thiamin" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryThiamin];
    } else if ([@"VitaminA" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminA];
    } else if ([@"VitaminB12" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminB12];
    } else if ([@"VitaminB6" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminB6];
    } else if ([@"VitaminC" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminC];
    } else if ([@"VitaminD" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminD];
    } else if ([@"VitaminE" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminE];
    } else if ([@"VitaminK" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminK];
    } else if ([@"Zinc" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryZinc];
    } else if ([@"Water" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryWater];
    } else if ([@"BloodGlucose" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodGlucose];
    } else if ([@"ElectrodermalActivity" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierElectrodermalActivity];
    } else if ([@"ForcedExpiratoryVolume1" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierForcedExpiratoryVolume1];
    } else if ([@"ForcedVitalCapacity" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierForcedVitalCapacity];
    } else if ([@"InhalerUsage" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierInhalerUsage];
    } else if ([@"InsulinDelivery" isEqualToString:key] && systemVersion >= 11.0) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierInsulinDelivery];
    }

    // Vital Signs Identifiers
    if ([@"HeartRate" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
    } else if ([@"WalkingHeartRateAverage" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierWalkingHeartRateAverage];
    } else if ([@"RestingHeartRate" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRestingHeartRate];
    } else if ([@"HeartRateVariability" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRateVariabilitySDNN];
    }  else if ([@"Vo2Max" isEqualToString: key] && systemVersion >= 11.0) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierVO2Max];
    } else if ([@"BodyTemperature" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyTemperature];
    } else if ([@"BloodPressureSystolic" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureSystolic];
    } else if ([@"BloodPressureDiastolic" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureDiastolic];
    } else if ([@"RespiratoryRate" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRespiratoryRate];
    } else if ([@"OxygenSaturation" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierOxygenSaturation];
    }
    if (@available(iOS 12.2, *)) {
        if ([@"HighHeartRateEvent" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierHighHeartRateEvent];
        } else if ([@"IrregularHeartRhythmEvent" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierIrregularHeartRhythmEvent];
        } else if ([@"LowHeartRateEvent" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierLowHeartRateEvent];
        }
    }
    if (@available(iOS 13.0, *)) {
        if ([@"HeartbeatSeries" isEqualToString: key]) {
            return [HKObjectType seriesTypeForIdentifier:HKDataTypeIdentifierHeartbeatSeries];
        }
    }
    if (@available(iOS 14.0, *)) {
        if ([@"Electrocardiogram" isEqualToString:key]) {
            return HKObjectType.electrocardiogramType;
        }
    }
    if (@available(iOS 14.3, *)) {
        if ([@"LowCardioFitnessEvent" isEqualToString: key]) {
            return [HKObjectType quantityTypeForIdentifier:HKCategoryTypeIdentifierLowCardioFitnessEvent];
        }
    }
    if (@available(iOS 15.0, *)) {
        if ([@"NumberOfAlcoholicBeverages" isEqualToString: key]) {
            return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierNumberOfAlcoholicBeverages];
        }
    }


    // Mobility
    if (@available(iOS 14.0, *)) {
        if ([@"SixMinuteWalkTestDistance" isEqualToString: key]) {
           return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierSixMinuteWalkTestDistance];
       }
    }
    if (@available(iOS 15.0, *)) {
        if ([@"AppleWalkingSteadiness" isEqualToString: key]) {
            return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierAppleWalkingSteadiness];
        } else if ([@"AppleWalkingSteadinessEvent" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierAppleWalkingSteadinessEvent];
        }
    }


    // Reproductive health
    if ([@"MenstrualFlow" isEqualToString: key]) {
        return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierMenstrualFlow];
    } else if ([@"IntermenstrualBleeding" isEqualToString: key]) {
        return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierIntermenstrualBleeding];
    } else if ([@"BasalBodyTemperature" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBasalBodyTemperature];
    } else if ([@"CervicalMucusQuality" isEqualToString: key]) {
        return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierCervicalMucusQuality];
    } else if ([@"OvulationTestResult" isEqualToString: key]) {
        return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierOvulationTestResult];
    } else if ([@"SexualActivity" isEqualToString: key]) {
        return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierSexualActivity];
    }
    if (@available(iOS 14.3, *)) {
        if ([@"Contraceptive" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierContraceptive];
        } else if ([@"Pregnancy" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierPregnancy];
        } else if ([@"Lactation" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierLactation];
        }
    }
    if (@available(iOS 15.0, *)) {
        if ([@"ProgesteroneTestResult" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierProgesteroneTestResult];
        } else if ([@"PregnancyTestResult" isEqualToString: key]) {
            return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierPregnancyTestResult];
        }
    }

    // UV radiation
    if ([@"UvExposure" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierUVExposure];
    }

    // Sleep
    if ([@"SleepAnalysis" isEqualToString: key]) {
        return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierSleepAnalysis];
    }

    // workouts
    if ([@"MindfulSession" isEqualToString: key] && systemVersion >= 10.0) {
        return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierMindfulSession];
    } else if ([@"MindfulSession" isEqualToString: key]){
        return [HKObjectType workoutType];
    } else if ([@"Workout" isEqualToString: key]) {
        return [HKObjectType workoutType];
    }else if ([@"WorkoutRoute" isEqualToString:key]){
        return [HKSeriesType workoutRouteType];
    }

    // Lab and tests
    if ([@"BloodAlcoholContent" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodAlcoholContent];
    }
    
    // Activity Summary
    if ([@"ActivitySummary" isEqualToString:key]){
        return [HKObjectType activitySummaryType];
    }
    
    // Clinical Records
    if ([@"AllergyRecord" isEqualToString:key]) {
        return [RCTAppleHealthKit clinicalTypeFromName:@"AllergyRecord"];
    } else if ([@"ConditionRecord" isEqualToString:key]) {
        return [RCTAppleHealthKit clinicalTypeFromName:@"ConditionRecord"];
    } else if ([@"CoverageRecord" isEqualToString:key]) {
        return [RCTAppleHealthKit clinicalTypeFromName:@"CoverageRecord"];
    } else if ([@"ImmunizationRecord" isEqualToString:key]) {
        return [RCTAppleHealthKit clinicalTypeFromName:@"ImmunizationRecord"];
    } else if ([@"LabResultRecord" isEqualToString:key]) {
        return [RCTAppleHealthKit clinicalTypeFromName:@"LabResultRecord"];
    } else if ([@"MedicationRecord" isEqualToString:key]) {
        return [RCTAppleHealthKit clinicalTypeFromName:@"MedicationRecord"];
    } else if ([@"ProcedureRecord" isEqualToString:key]) {
        return [RCTAppleHealthKit clinicalTypeFromName:@"ProcedureRecord"];
    } else if ([@"VitalSignRecord" isEqualToString:key]) {
        return [RCTAppleHealthKit clinicalTypeFromName:@"VitalSignRecord"];
    }

    return nil;
}

- (nullable HKObjectType *)getWritePermFromText:(nonnull NSString*) key {
    // Body Measurements
    if ([@"Height" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight];
    } else if ([@"PeakFlow" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierPeakExpiratoryFlowRate];
    } else if ([@"WaistCircumference" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierWaistCircumference];
    } else if ([@"Weight" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
    } else if ([@"BodyMass" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
    } else if ([@"BodyFatPercentage" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyFatPercentage];
    } else if ([@"BodyMassIndex" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMassIndex];
    } else if ([@"LeanBodyMass" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierLeanBodyMass];
    } else if ([@"BodyTemperature" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyTemperature];
    }

    // Fitness Identifiers
    if ([@"Steps" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    } else if ([@"StepCount" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    } else if ([@"DistanceWalkingRunning" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning];
    } else if ([@"RunningSpeed" isEqualToString:key]) {
        if (@available(iOS 16.0, *)) {
            return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRunningSpeed];
        } else {
            return nil;
        }
    } else if ([@"DistanceCycling" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceCycling];
    } else if ([@"DistanceSwimming" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceSwimming];
    } else if ([@"BasalEnergyBurned" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBasalEnergyBurned];
    } else if ([@"ActiveEnergyBurned" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];
    } else if ([@"FlightsClimbed" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierFlightsClimbed];
    } else if ([@"RunningPower" isEqualToString:key]) {
        if (@available(iOS 16.0, *)) {
            return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRunningPower];
        } else {
            return nil;
        }
    } else if ([@"RunningStrideLength" isEqualToString:key]) {
        if (@available(iOS 16.0, *)) {
            return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRunningStrideLength];
        } else {
            return nil;
        }
    } else if ([@"RunningVerticalOscillation" isEqualToString:key]) {
        if (@available(iOS 16.0, *)) {
            return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRunningVerticalOscillation];
        } else {
            return nil;
        }
    } else if ([@"RunningGroundContactTime" isEqualToString:key]) {
        if (@available(iOS 16.0, *)) {
            return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRunningGroundContactTime];
        } else {
            return nil;
        }
    }

    // Nutrition Identifiers
    if ([@"Biotin" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryBiotin];
    } else if ([@"Caffeine" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCaffeine];
    } else if ([@"Calcium" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCalcium];
    } else if ([@"Carbohydrates" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCarbohydrates];
    } else if ([@"Chloride" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryChloride];
    } else if ([@"Cholesterol" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCholesterol];
    } else if ([@"Copper" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCopper];
    } else if ([@"EnergyConsumed" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryEnergyConsumed];
    } else if ([@"FatMonounsaturated" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatMonounsaturated];
    } else if ([@"FatPolyunsaturated" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatPolyunsaturated];
    } else if ([@"FatSaturated" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatSaturated];
    } else if ([@"FatTotal" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatTotal];
    } else if ([@"Fiber" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFiber];
    } else if ([@"Folate" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFolate];
    } else if ([@"Iodine" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryIodine];
    } else if ([@"Iron" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryIron];
    } else if ([@"Magnesium" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryMagnesium];
    } else if ([@"Manganese" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryManganese];
    } else if ([@"Molybdenum" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryMolybdenum];
    } else if ([@"Niacin" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryNiacin];
    } else if ([@"PantothenicAcid" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPantothenicAcid];
    } else if ([@"Phosphorus" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPhosphorus];
    } else if ([@"Potassium" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPotassium];
    } else if ([@"Protein" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryProtein];
    } else if ([@"Riboflavin" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryRiboflavin];
    } else if ([@"Selenium" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySelenium];
    } else if ([@"Sodium" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySodium];
    } else if ([@"Sugar" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySugar];
    } else if ([@"Thiamin" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryThiamin];
    } else if ([@"VitaminA" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminA];
    } else if ([@"VitaminB12" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminB12];
    } else if ([@"VitaminB6" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminB6];
    } else if ([@"VitaminC" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminC];
    } else if ([@"VitaminD" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminD];
    } else if ([@"VitaminE" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminE];
    } else if ([@"VitaminK" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminK];
    } else if ([@"Zinc" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryZinc];
    } else if ([@"Water" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryWater];
    } else if ([@"BloodGlucose" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodGlucose];
    } else if ([@"InsulinDelivery" isEqualToString:key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierInsulinDelivery];
    }

    // Sleep
    if ([@"SleepAnalysis" isEqualToString:key]) {
        return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierSleepAnalysis];
    }

    // Mindfulness
    if ([@"MindfulSession" isEqualToString:key]) {
        return [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierMindfulSession];
    }

    // Workout
    if ([@"Workout" isEqualToString:key]) {
        return [HKObjectType workoutType];
    }
    
    // Workout Route
    if ([@"WorkoutRoute" isEqualToString:key]) {
        if (@available(iOS 11.0, *)) {
            return [HKSeriesType workoutRouteType];
        } else {
            return nil;
        }
    }

    // Lab and tests
    if ([@"BloodAlcoholContent" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodAlcoholContent];
    }
    if ([@"HeartRate" isEqualToString: key]) {
        return [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
    }

    return nil;
}

// Returns HealthKit read permissions from options array
- (NSSet *)getReadPermsFromOptions:(NSArray *)options {
    NSMutableSet *readPermSet = [NSMutableSet setWithCapacity:1];

    for(int i=0; i<[options count]; i++) {
        NSString *optionKey = options[i];
        if (optionKey != nil){
            HKObjectType *val = [self getReadPermFromText:optionKey];
            if (val != nil) {
                [readPermSet addObject:val];
            }
        }
    }
    return readPermSet;
}


// Returns HealthKit write permissions from options array
- (NSSet *)getWritePermsFromOptions:(NSArray *)options {
    NSMutableSet *writePermSet = [NSMutableSet setWithCapacity:1];

    for(int i=0; i<[options count]; i++) {
        NSString *optionKey = options[i];
        if (optionKey != nil){
            HKObjectType *val = [self getWritePermFromText:optionKey];
            if (val != nil) {
                [writePermSet addObject:val];
            }
        }
    }
    return writePermSet;
}

- (HKObjectType *)getWritePermFromString:(NSString *)writePerm {
    return [self getWritePermFromText:writePerm];
}

- (NSString *)getAuthorizationStatusString:(HKAuthorizationStatus)status {
    switch (status) {
        case HKAuthorizationStatusNotDetermined:
            return @"NotDetermined";
        case HKAuthorizationStatusSharingDenied:
            return @"SharingDenied";
        case HKAuthorizationStatusSharingAuthorized:
            return @"SharingAuthorized";
    }
}


+ (NSDictionary *)getStringToWorkoutActivityTypeDictionary {
    NSDictionary *elem = @{
        @"AmericanFootball": @(HKWorkoutActivityTypeAmericanFootball),
        @"Archery": @(HKWorkoutActivityTypeArchery),
        @"AustralianFootball": @(HKWorkoutActivityTypeAustralianFootball),
        @"Badminton": @(HKWorkoutActivityTypeBadminton),
        @"Baseball": @(HKWorkoutActivityTypeBaseball),
        @"Basketball": @(HKWorkoutActivityTypeBasketball),
        @"Bowling": @(HKWorkoutActivityTypeBowling),
        @"Boxing": @(HKWorkoutActivityTypeBoxing),
        @"Climbing": @(HKWorkoutActivityTypeClimbing),
        @"Cricket": @(HKWorkoutActivityTypeCricket),
        @"CrossTraining": @(HKWorkoutActivityTypeCrossTraining),
        @"Curling": @(HKWorkoutActivityTypeCurling),
        @"Cycling": @(HKWorkoutActivityTypeCycling),
        @"Dance": @(HKWorkoutActivityTypeDance),
        @"Elliptical": @(HKWorkoutActivityTypeElliptical),
        @"EquestrianSports": @(HKWorkoutActivityTypeEquestrianSports),
        @"Fencing": @(HKWorkoutActivityTypeFencing),
        @"Fishing": @(HKWorkoutActivityTypeFishing),
        @"FunctionalStrengthTraining": @(HKWorkoutActivityTypeFunctionalStrengthTraining),
        @"Golf": @(HKWorkoutActivityTypeGolf),
        @"Gymnastics": @(HKWorkoutActivityTypeGymnastics),
        @"Handball": @(HKWorkoutActivityTypeHandball),
        @"Hiking": @(HKWorkoutActivityTypeHiking),
        @"Hockey": @(HKWorkoutActivityTypeHockey),
        @"Hunting": @(HKWorkoutActivityTypeHunting),
        @"Lacrosse": @(HKWorkoutActivityTypeLacrosse),
        @"MartialArts": @(HKWorkoutActivityTypeMartialArts),
        @"MindAndBody": @(HKWorkoutActivityTypeMindAndBody),
        @"PaddleSports": @(HKWorkoutActivityTypePaddleSports),
        @"Play": @(HKWorkoutActivityTypePlay),
        @"PreparationAndRecovery": @(HKWorkoutActivityTypePreparationAndRecovery),
        @"Racquetball": @(HKWorkoutActivityTypeRacquetball),
        @"Rowing": @(HKWorkoutActivityTypeRowing),
        @"Rugby": @(HKWorkoutActivityTypeRugby),
        @"Running": @(HKWorkoutActivityTypeRunning),
        @"Sailing": @(HKWorkoutActivityTypeSailing),
        @"SkatingSports": @(HKWorkoutActivityTypeSkatingSports),
        @"SnowSports": @(HKWorkoutActivityTypeSnowSports),
        @"Soccer": @(HKWorkoutActivityTypeSoccer),
        @"Softball": @(HKWorkoutActivityTypeSoftball),
        @"Squash": @(HKWorkoutActivityTypeSquash),
        @"StairClimbing": @(HKWorkoutActivityTypeStairClimbing),
        @"SurfingSports": @(HKWorkoutActivityTypeSurfingSports),
        @"Swimming": @(HKWorkoutActivityTypeSwimming),
        @"TableTennis": @(HKWorkoutActivityTypeTableTennis),
        @"Tennis": @(HKWorkoutActivityTypeTennis),
        @"TrackAndField": @(HKWorkoutActivityTypeTrackAndField),
        @"TraditionalStrengthTraining": @(HKWorkoutActivityTypeTraditionalStrengthTraining),
        @"Volleyball": @(HKWorkoutActivityTypeVolleyball),
        @"Walking": @(HKWorkoutActivityTypeWalking),
        @"WaterFitness": @(HKWorkoutActivityTypeWaterFitness),
        @"WaterPolo": @(HKWorkoutActivityTypeWaterPolo),
        @"WaterSports": @(HKWorkoutActivityTypeWaterSports),
        @"Wrestling": @(HKWorkoutActivityTypeWrestling),
        @"Yoga": @(HKWorkoutActivityTypeYoga),
        @"Barre": @(HKWorkoutActivityTypeBarre),
        @"CoreTraining": @(HKWorkoutActivityTypeCoreTraining),
        @"CrossCountrySkiing": @(HKWorkoutActivityTypeCrossCountrySkiing),
        @"DownhillSkiing": @(HKWorkoutActivityTypeDownhillSkiing),
        @"Flexibility": @(HKWorkoutActivityTypeFlexibility),
        @"HighIntensityIntervalTraining": @(HKWorkoutActivityTypeHighIntensityIntervalTraining),
        @"JumpRope": @(HKWorkoutActivityTypeJumpRope),
        @"Kickboxing": @(HKWorkoutActivityTypeKickboxing),
        @"Pilates": @(HKWorkoutActivityTypePilates),
        @"Snowboarding": @(HKWorkoutActivityTypeSnowboarding),
        @"Stairs": @(HKWorkoutActivityTypeStairs),
        @"StepTraining": @(HKWorkoutActivityTypeStepTraining),
        @"WheelchairWalkPace": @(HKWorkoutActivityTypeWheelchairWalkPace),
        @"WheelchairRunPace": @(HKWorkoutActivityTypeWheelchairRunPace),
        @"TaiChi": @(HKWorkoutActivityTypeTaiChi),
        @"MixedCardio": @(HKWorkoutActivityTypeMixedCardio),
        @"HandCycling": @(HKWorkoutActivityTypeHandCycling),
        @"Other": @(HKWorkoutActivityTypeOther),
    };

    NSMutableDictionary *result = [elem mutableCopy];

    if (@available(iOS 13.0, *)) {
        result[@"DiscSports"] = @(HKWorkoutActivityTypeDiscSports);
        result[@"FitnessGaming"] = @(HKWorkoutActivityTypeFitnessGaming);
    }

    if (@available(iOS 14.0, *)) {
        result[@"CardioDance"] = @(HKWorkoutActivityTypeCardioDance);
        result[@"SocialDance"] = @(HKWorkoutActivityTypeSocialDance);
        result[@"Pickleball"] = @(HKWorkoutActivityTypePickleball);
        result[@"Cooldown"] = @(HKWorkoutActivityTypeCooldown);
    }

    return result;
}


@end
