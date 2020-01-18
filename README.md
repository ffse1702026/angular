{
  "name": "agoda-app",
  "version": "0.0.0",
  "scripts": {
    "ng": "ng",
    "start": "ng serve",
    "build": "ng build",
    "test": "ng test",
    "lint": "ng lint",
    "e2e": "ng e2e"
  },
  "private": true,
  "dependencies": {
    "@angular/animations": "~8.2.13",
    "@angular/cdk": "~8.2.3",
    "@angular/common": "~8.2.13",
    "@angular/compiler": "~8.2.13",
    "@angular/core": "~8.2.13",
    "@angular/forms": "~8.2.13",
    "@angular/material": "^8.2.3",
    "@angular/platform-browser": "~8.2.13",
    "@angular/platform-browser-dynamic": "~8.2.13",
    "@angular/router": "~8.2.13",
    "@ng-bootstrap/ng-bootstrap": "^5.1.4",
    "@types/jquery": "^3.3.31",
    "bootstrap": "^4.4.1",
    "hammerjs": "^2.0.8",
    "jquery": "^3.4.1",
    "json-server": "^0.15.1",
    "moment": "^2.24.0",
    "ngx-bootstrap": "^5.2.0",
    "ngx-gallery": "^5.10.0",
    "ngx-rest-ex": "^2.3.0",
    "ngx-toastr": "^11.2.1",
    "rxjs": "^6.5.3",
    "tslib": "^1.10.0",
    "zone.js": "~0.9.1"
  },
  "devDependencies": {
    "@angular-devkit/build-angular": "~0.803.17",
    "@angular/cli": "~8.3.17",
    "@angular/compiler-cli": "~8.2.13",
    "@angular/language-service": "~8.2.13",
    "@types/node": "~8.9.4",
    "@types/jasmine": "~3.3.8",
    "@types/jasminewd2": "~2.0.3",
    "codelyzer": "^5.0.0",
    "jasmine-core": "~3.4.0",
    "jasmine-spec-reporter": "~4.2.1",
    "karma": "~4.1.0",
    "karma-chrome-launcher": "~2.2.0",
    "karma-coverage-istanbul-reporter": "~2.0.1",
    "karma-jasmine": "~2.0.1",
    "karma-jasmine-html-reporter": "^1.4.0",
    "protractor": "~5.4.0",
    "ts-node": "~7.0.0",
    "tslint": "~5.15.0",
    "typescript": "~3.5.3"
  }
}

import {
    transition,
    trigger,
    query,
    style,
    animate,
    group,
    stagger,
    animateChild,
    sequence
} from '@angular/animations';
import { AnimationsService } from './app.transition.service';

const animations = [
    trigger('appendItemToListAnimation', [
        transition(':enter', [
            query(
                '.animated-item',
                [
                    style({ opacity: 0, transform: 'translateY(-50px)' }),
                    stagger(300, [
                        animate(
                            '500ms cubic-bezier(0.35, 0, 0.25, 1)',
                            style({ opacity: 1, transform: 'none' })
                        )
                    ])
                ],
                { optional: true }
            )
        ])
    ]),
    trigger('expandeCollapseAnimation', [
        transition(':enter', [
            query(
                '.animated-item',
                [
                    style({ opacity: 0 }),
                    animate('500ms cubic-bezier(0.35, 0, 0.25, 1)', style({ opacity: 1 }))
                ],
                { optional: true }
            )
        ]),
        transition(':leave', [
            query(
                '.animated-item',
                [
                    style({ opacity: 1 }),
                    animate('500ms cubic-bezier(0.35, 0, 0.25, 1)', style({ opacity: 0 }))
                ],
                { optional: true }
            )
        ])
    ]),
    trigger('nextStepAnimation', [
        transition(':enter', [
            style({
                transform: 'translateX(100%)',
                position: 'absolute',
                opacity: 0
            }),
            animate(
                '300ms cubic-bezier(0.35, 0, 0.25, 1)',
                style({ transform: 'translateX(0%)', opacity: 1 })
            )
        ]),
        transition(':leave', [
            style({
                position: 'absolute',
                opacity: 1
            }),
            animate('100ms ease-in', style({ opacity: 0 }))
        ])
    ])
];
export const ComponentAnimations = animations;

// Element transitions
const STEPS_ALL: any[] = [
    query(':enter > *', style({ opacity: 0, position: 'fixed' }), {
        optional: true
    }),
    query(':enter div', style({ opacity: 0 }), {
        optional: true
    }),
    sequence([
        query(
            ':leave > *',
            [
                style({ transform: 'translateY(0%)', opacity: 1 }),
                animate(
                    '0.2s ease-in-out',
                    style({ transform: 'translateY(-3%)', opacity: 0 })
                ),
                style({ position: 'fixed' })
            ],
            { optional: true }
        ),
        query(
            ':enter > *',
            [
                style({
                    transform: 'translateY(-3%)',
                    opacity: 0,
                    position: 'static'
                }),
                animate(
                    '0.5s ease-in-out',
                    style({ transform: 'translateY(0%)', opacity: 1 })
                )
            ],
            { optional: true }
        )
    ]),
    query(
        ':enter div, :enter h1, :enter h2, :enter h3, :enter table',
        stagger(20, [
            style({ transform: 'translateY(-5%)', opacity: 0 }),
            animate(
                '0.5s ease-in-out',
                style({ transform: 'translateY(0%)', opacity: 1 })
            )
        ]),
        { optional: true }
    )
];
const STEPS_NONE = [];
const STEPS_PAGE = [STEPS_ALL[0], STEPS_ALL[2]];
const STEPS_ELEMENTS = [STEPS_ALL[1], STEPS_ALL[3]];

export const routeAnimations = [
    trigger('routeAnimations', [
        transition(isRouteAnimationsAll, STEPS_ALL),
        transition(isRouteAnimationsNone, STEPS_NONE),
        transition(isRouteAnimationsPage, STEPS_PAGE),
        transition(isRouteAnimationsElements, STEPS_ELEMENTS)
    ])
];

export function isRouteAnimationsAll() {
    return AnimationsService.isRouteAnimationsType('ALL');
}

export function isRouteAnimationsNone() {
    return AnimationsService.isRouteAnimationsType('NONE');
}

export function isRouteAnimationsPage() {
    return AnimationsService.isRouteAnimationsType('PAGE');
}

export function isRouteAnimationsElements() {
    return AnimationsService.isRouteAnimationsType('ELEMENTS');
}

//
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class AnimationsService {
  constructor() {
    AnimationsService.routeAnimationType = 'ELEMENTS';
  }

  private static routeAnimationType: RouteAnimationType = 'ELEMENTS';

  static isRouteAnimationsType(type: RouteAnimationType) {
    return AnimationsService.routeAnimationType === type;
  }

  updateRouteAnimationType(
    pageAnimations: boolean,
    elementsAnimations: boolean
  ) {
    AnimationsService.routeAnimationType =
      pageAnimations && elementsAnimations
        ? 'ALL'
        : pageAnimations
        ? 'PAGE'
        : elementsAnimations
        ? 'ELEMENTS'
        : 'NONE';
  }
}

export type RouteAnimationType = 'ALL' | 'PAGE' | 'ELEMENTS' | 'NONE';


import { FormControl, FormGroup, FormArray, AbstractControl, Validators } from '@angular/forms';
import { VISIT_TYPE, ACTIVITY_INPUT } from 'src/app/common/constant';
import { ActivityFormValidator } from './activity.form.validator';
import { ValidationErrors } from '@angular/forms/src/directives/validators';
import { NumbericValidator } from 'src/app/validator/Numberic.validator';
import { FullwidthValidator } from 'src/app/validator/fullwidth.validator';
import { InjectorInstance } from 'src/app/app.component';
import { ElementRef } from '@angular/core';

/**
 * Apply mixins in typescript
 * @param derivedCtor Derived class
 * @param baseCtors Base class
 */
function applyMixins(derivedCtor: any, baseCtors: any[]) {
    baseCtors.forEach(baseCtor => {
        Object.getOwnPropertyNames(baseCtor.prototype).forEach(name => {
            Object.defineProperty(derivedCtor.prototype, name, Object.getOwnPropertyDescriptor(baseCtor.prototype, name));
        });
    });
}

/**
 * Base class for all of controls, contains reusable methods
 */
class ActivityControl {
    errors: any;
    invisible: boolean;
    required: boolean;
    parent: any;
    controls: any;
    invalid: boolean;
    optional: boolean;
    setErrors: (errors: ValidationErrors | null, opts?: {
        emitEvent?: boolean;
    }) => void;

    /**
     * Getting error message of form control
     */
    getValidationMessages() {
        const messages: string[] = [];
        const errors = this.errors;
        if (errors) {
            Object.keys(errors).forEach(errorName => {
                switch (errorName) {
                    case 'required':
                        messages.push(`${errors.required.msg}`);
                        break;
                    case 'DuplicateAgent':
                        messages.push(`${errors.DuplicateAgent.msg}`);
                        break;
                    case 'DuplicateCompliance':
                        messages.push(`${errors.DuplicateCompliance.msg}`);
                        break;
                    case 'InputNextVisitDate':
                        messages.push(`次回の訪問予定日を入力してください。`);
                        break;
                    case 'IncorrectTime':
                        messages.push(`${errors.IncorrectTime.msg}`);
                        break;
                    case 'NextVisitDateMustBeFuture':
                        messages.push(`${errors.NextVisitDateMustBeFuture.msg}`);
                        break;
                    case 'fullwidth':
                        messages.push(`全角文字のみを入力してください。`);
                        break;
                    case 'maxlength':
                        messages.push(`${errors.maxlength.requiredLength}文字以内で入力してください。`);
                        break;
                    case 'isNumberic':
                        messages.push(`数値のみを入力してください。`);
                        break;
                    case 'max':
                        messages.push(`${errors.max.max}以下で入力してください。`);
                        break;
                }
            });
        }
        return messages;
    }

    /**
     * Check if form control is invisible
     */
    isInvisible(): boolean {
        if (!this.invisible && this.parent) {
            // If parent of a form control is invisibled then it is invisibled
            if (this.parent instanceof FormControlGroup || this.parent instanceof FormControlArray) {
                return this.parent.isInvisible();
            }
        }
        return this.invisible;
    }

    isRequired(): boolean {
        if (!this.isInvisible()) {
            if (this instanceof FormControlGroup) {
                for (const name of Object.keys(this.controls)) {
                    const control = this.controls[name];
                    if (control && !control.isInvisible() && control.isRequired()) {
                        return true;
                    }
                }
            } else if (this instanceof FormControlArray) {
                for (const control of this.controls) {
                    if (control && !control.isInvisible() && control.isRequired()) {
                        return true;
                    }
                }
            } else if (this instanceof ActivityFormControl) {
                if (this.id && parseInt(this.id.charAt(this.id.length - 1), 10) === ACTIVITY_INPUT.PLAN
                && !this.root.get('planForm.visitDate').value) {
                    return false;
                }
                return this.required;
            }
        }
        return false;
    }
    setRequired(isRequired = true): void  {
        this.required = isRequired;

        if (!this.isInvisible()) {
            if (this instanceof FormControlGroup) {
                // if (!isRequired) {
                //     this.removeErrors(["required"]);
                // }
                for (let control in this.controls) {
                    this.controls[control]['required'] = isRequired;
                    // if(!isRequired) {
                    //     this.controls[control].removeErrors(["required"]);
                    // }
                }
            } else if (this instanceof FormControlArray) {
                // if (!isRequired) {
                //     this.removeErrors(["required"]);
                // }
                for (let control in this.controls) {
                    this.controls[control]['required'] = isRequired;
                    // if(!isRequired) {
                    //     this.controls[control].removeErrors(["required"]);
                    // }
                }
            } else if (this instanceof ActivityFormControl) {
                //this.required = isRequired;
                // if(!isRequired) {
                //     this.removeErrors(["required"]);

                // }
            }
        }
    }
    isOptional(): boolean {
        if (this.isRequired()) { return false; }
        return this.optional;
        // if (this.isRequired()) { return false; }
        // if (!this.isInvisible()) {
        //     if (this instanceof FormControlGroup) {
        //         for (const name of Object.keys(this.controls)) {
        //             const control = this.controls[name];
        //             return control && control.isOptional();
        //         }
        //     } else if (this instanceof FormControlArray) {
        //         for (const control of this.controls) {
        //             return control && control.isOptional();
        //         }
        //     } else if (this instanceof ActivityFormControl) {
        //         return this.optional;
        //     }
        // }
        // return false;
    }
    setOptional(isOptional = true): void  {
        this.optional = isOptional;
    }

    /**
     * Removing errors from errors object of a form control
     * @param keys list of errors name that will be removed
     */
    public removeErrors(keys: string[]) {
        if (!keys || keys.length === 0 || !this.errors) {
            return;
        }
        let remainingErrors = keys.reduce((errors, key) => {
            delete errors[key];
            return errors;
        }, { ...this.errors });
        if (Object.keys(remainingErrors || {}).length === 0) {
            remainingErrors = null;
        }
        this.setErrors(remainingErrors);
    }

    /**
     * Adding errors into errors object of a form control
     * @param errors object that contains new errors will be added
     */
    public addErrors(errors: { [key: string]: any }) {
        if (!errors) {
            return;
        }
        this.setErrors({ ...this.errors, ...errors });
    }

    public getFirstErrorControl(): ActivityFormControl {
        if (!this.isInvisible() && this.invalid) {
            if (this instanceof FormControlGroup) {
                for (const name of Object.keys(this.controls)) {
                    const control = this.controls[name];
                    if (control && !control.isInvisible() && control.invalid) {
                        return control.getFirstErrorControl();
                    }
                }
            } else if (this instanceof FormControlArray) {
                for (const control of this.controls) {
                    if (!control.isInvisible() && control.invalid) {
                        return control.getFirstErrorControl();
                    }
                }
            } else if (this instanceof ActivityFormControl) {
                return this;
            }
        }
    }
}

/**
 * Form control of Activity Form
 */
export class ActivityFormControl extends FormControl implements ActivityControl {
    optional: boolean;

    controls: any;
    /**
     * Control visible status of a form control
     */
    invisible: boolean;

    required: boolean;

    /**
     * List of options if this is form control of a select
     */
    optionList: Array<any>;

    /**
     * Label if this is form control of a check box
     */
    label: string;

    /**
     * Additional value of a form control
     */
    valueObj: any;

    /**
     * If true, disable a form control by CSS
     */
    fakeDisable: boolean;

    /**
     * ID attribute of DOM element
     */
    id: string;

    getValidationMessages: () => string[];
    isInvisible: () => boolean;
    isRequired: () => boolean;
    isOptional: () => boolean;
    removeErrors: (keys: string[]) => void;
    addErrors: (errors: { [key: string]: any }) => void;
    getFirstErrorControl: () => ActivityFormControl;
    setRequired: (isRequied: boolean) => void;
    setOptional: (isOptional?: boolean) => void;
    constructor(invisible: boolean, disable: boolean, val: any, validator: any, id: string, required?: boolean) {
        super({ value: val, disabled: disable }, validator);
        this.invisible = invisible;
        this.fakeDisable = false;
        this.id = id;
        this.required = required;
    }

    /**
     * Disable this form control
     * @param condition if true, disable form control, otherwise, enable
     * @param fakeDisable if true, disable form control by CSS
     */
    disableControl(condition: boolean, fakeDisable?: boolean) {
        if (fakeDisable) {
            this.fakeDisable = condition;
        } else {
            if (condition) {
                this.disable();
            } else {
                this.enable();
            }
        }
    }

    isDisable(): boolean {
        return this.disabled || this.fakeDisable;
    }

    /**
     * Finding a option in list of options
     * @param findFn function that is used by find method
     */
    selectValueInList(findFn: (ele) => boolean, defaultSelection?) {
        if (this.optionList && this.optionList.find(findFn)) {
            this.setValue(this.optionList.find(findFn));
        } else {
            if (defaultSelection) {
                this.setValue(defaultSelection);
            } else {
                this.setValue('');
            }
        }
    }

    /**
     * Setting value of form control by initial value
     * @param value initial value, if not set, set value to empty string or first item in option list
     */
    clear(value?: any) {
        if (value != null) {
            this.setValue(value);
        } else {
            if (this.optionList && this.optionList.length > 0) {
                this.setValue(this.optionList[0]);
            } else {
                this.setValue('');
            }
        }
    }

    /**
     * Fire focus event of DOM element
     */
    focus() {
        if (this.id) {
            try {
                const elRef = InjectorInstance.get(ElementRef);
                if (this.fakeDisable || this.disabled) {
                    (elRef.nativeElement as any).querySelector(`#LinkTo${this.id}`).focus();
                } else {
                    (elRef.nativeElement as any).querySelector(`#${this.id}`).focus();
                }
            } catch (err) {
                // ID did not match any elements
                console.log(err.message);
            }
        }
    }
    /*
     * Fire click event of DOM element
    */
    click() {
        if (this.id) {
            try {
                const elRef = InjectorInstance.get(ElementRef);
                if (this.fakeDisable || this.disabled) {
                    (elRef.nativeElement as any).querySelector(`#LinkTo${this.id}`).click();
                } else {
                    (elRef.nativeElement as any).querySelector(`#${this.id}`).click();
                }
            } catch (err) {
                // ID did not match any elements
                console.log(err.message);
            }
        }
    }
}
applyMixins(ActivityFormControl, [ActivityControl]);

/**
 * Custom Form Group of Activity Form
 */
export class FormControlGroup extends FormGroup {
    invisible: boolean;
    required: boolean;
    getValidationMessages: () => string[];
    isInvisible: () => boolean;
    isRequired: () => boolean;
    isOptional: () => boolean;
    removeErrors: (keys: string[]) => void;
    addErrors: (errors: { [key: string]: any }) => void;
    getFirstErrorControl: () => ActivityFormControl;
    setRequired: (isRequied: boolean) => void;
    setOptional: (isOptional?: boolean) => void;
    constructor(invisible: boolean, formControlList: any) {
        super(formControlList);
        this.invisible = invisible;
    }

    /**
     * Getting instance of FormControlGroup by name
     * @param name name of FormControlGroup, separated by dot
     */
    getFormControlGroup(name: string): FormControlGroup {
        return (this.getControl(name) as FormControlGroup);
    }

    /**
     * Getting instance of FormControlArray by name
     * @param name name of FormControlArray, separated by dot
     */
    getFormControlArray(name: string): FormControlArray {
        return (this.getControl(name) as FormControlArray);
    }

    /**
     * Getting instance of ActivityFormControl by name
     * @param name name of ActivityFormControl, separated by dot
     */
    getActivityFormControl(name: string): ActivityFormControl {
        return (this.getControl(name) as ActivityFormControl);
    }

    /**
     * Getting instance of AbstractControl by name
     * @param name name of AbstractControl, separated by dot
     */
    getControl(name: string): AbstractControl {
        const names = name.split('.');
        let form: AbstractControl = this;
        names.forEach(elem => {
            form = form.get(elem);
        });
        return form;
    }
}
applyMixins(FormControlGroup, [ActivityControl]);

/**
 * Custom FormArray of Activity Form
 */
export class FormControlArray extends FormArray {
    invisible: boolean;
    required: boolean;
    optional: boolean;
    optionList: Array<any>;
    id: string;
    getValidationMessages: () => string[];
    isInvisible: () => boolean;
    isRequired: () => boolean;
    isOptional: () => boolean;
    removeErrors: (keys: string[]) => void;
    addErrors: (errors: { [key: string]: any }) => void;
    getFirstErrorControl: () => ActivityFormControl;
    setRequired: (isRequied: boolean) => void;
    setOptional: (isOptional?: boolean) => void;
    constructor(invisible: boolean, controls: AbstractControl[], id?: string) {
        super(controls);
        this.invisible = invisible;
        this.id = id;
    }

    /**
     * Select value of child control of this FormArray
     * @param index index of child control
     * @param findFn function that is used for find method
     */
    selectValueInList(index: number, findFn: (ele) => boolean) {
        if (this.optionList.find(findFn)) {
            this.controls[index].setValue(this.optionList.find(findFn));
        } else {
            this.controls[index].setValue('');
        }
    }

    removeAll() {
        while (this.controls.length !== 0) {
            this.removeAt(0);
        }
        this.enable();
        this.updateValueAndValidity();
    }
}
applyMixins(FormControlArray, [ActivityControl]);

/**
 * Custom FormGroup for Activity form
 */
export class ActivityFormGroup extends FormControlGroup {
    submitted = false;
    inputType: ACTIVITY_INPUT;

    getValidationMessages: () => string[];
    isInvisible: () => boolean;
    isRequired: () => boolean;
    isOptional: () => boolean;
    setOptional: (isOptional?: boolean) => void;
    removeErrors: (keys: string[]) => void;
    addErrors: (errors: { [key: string]: any }) => void;
    getFirstErrorControl: () => ActivityFormControl;

    constructor(inputType) {
        super(false, {
            visitDate: new ActivityFormControl(false, false, null, null, 'KATHOUW' + inputType, true),
            visitTime: new FormControlGroup(false, {
                // startTime: new ActivityFormControl(false, false, '', null, 'IG6131HH' + inputType, true),
                startTimeMin: new ActivityFormControl(false, false, '00', null, 'IG6131MM' + inputType, true),
                startTimeHours: new ActivityFormControl(false, false, '', null, 'IG6131HH' + inputType, true),
                // endTime: new ActivityFormControl(false, false, '', null,  'IG6132HH' + inputType, true),
                endTimeHours: new ActivityFormControl(false, false, '', null,  'IG6132HH' + inputType, true),
                endTimeMin: new ActivityFormControl(false, false, '00', null,  'IG6132MM' + inputType, true)
            }),
            visitCategory: new ActivityFormControl(false, false, VISIT_TYPE.AGENCY, null, 'IG6121' + inputType, true),
            visitingName: new FormControlGroup(false, {
                visiting: new ActivityFormControl(false, false, null, null, 'IG612K' + inputType, true),
                customerName: new ActivityFormControl(false, false, null, null, 'IF0551' + inputType, true),
                getCustomerNameBtn: new ActivityFormControl(false, false, '', null, 'LinkToIF0551' + inputType),
                visitDestinationName: new ActivityFormControl(false, false, null, Validators.compose([
                    FullwidthValidator.fullwidth(), Validators.maxLength(15)
                ]), 'IG6122' + inputType),
            }),
            interviewee: new FormControlGroup(false, {
                interviewee1: new ActivityFormControl(false, false, null, null, 'IG6133' + inputType, true),
                interviewee2: new ActivityFormControl(false, false, null, null, 'IG6134' + inputType, true),
                interviewee2txt: new ActivityFormControl(true, false, null, Validators.compose([
                    FullwidthValidator.fullwidth(), Validators.maxLength(10)
                ]), 'IG6134' + inputType, true),
                // displayEmployeeBtn: new ActivityFormControl(false, false, '使用人表示', null, null),
                interviewername: new ActivityFormControl(false, false, null, Validators.compose([
                    FullwidthValidator.fullwidth(), Validators.maxLength(10)
                ]), 'IG6134' + inputType, true),
            }),
            companion: new ActivityFormControl(false, false, null, null, 'IG6182' + inputType),
            activityArray: new FormControlArray(false, [
                new ActivityFormControl(false, false, null, null, 'IG61350' + inputType, true)
            ]),
            minusBtn: new ActivityFormControl(false, false, null, null, null),
            plusBtn: new ActivityFormControl(false, false, null, null, null),
            purpose: new ActivityFormControl(false, false, null, null, 'IG6184' + inputType, true),
            outlineExplanation: new ActivityFormControl(false, false, 1, null, 'IG6187' + inputType, true),
            training: new FormControlGroup(false, {
                numberOfParticipants: new ActivityFormControl(false, false, 0, Validators.compose([
                    NumbericValidator.isNumberic(), Validators.max(999)
                ]), 'IG61441' + inputType, true),
                trainingContentArray: new FormControlArray(false, [
                    new FormControlGroup(false, {
                        trainingContent: new ActivityFormControl(false, false, null, null, 'IG61411' + inputType, true),
                        remarks: new ActivityFormControl(false, false, null, Validators.compose([
                            FullwidthValidator.fullwidth(), Validators.maxLength(15)
                        ]), 'IG61421' + inputType)
                    })
                ]),
                trainingContentMinusBtn: new ActivityFormControl(false, false, null, null, null),
                trainingContentPlusBtn: new ActivityFormControl(false, false, null, null, null),
                trainingItems: new FormControlArray(false, [], 'IG6N001' + inputType),
            }),
            concreteContent: new ActivityFormControl(false, false, null, Validators.compose([
                FullwidthValidator.fullwidth(), Validators.maxLength(100)
            ]), 'IG615K1' + inputType, false),
            voiceBtn: new ActivityFormControl(false, false, null, null, null),
        });
        this.inputType = inputType;
    }
    clearValidators(){
        this.clearValidators();
    }
    addValidators() {
        this.setValidators([
            ActivityFormValidator.RequiredDisabledField('visitDate', '訪問日を入力してください。'),
            // ActivityFormValidator.InputNextVisitDate(),
            ActivityFormValidator.StartEndTimeValidator(),
            ActivityFormValidator.ActivityArrayValidator(),
            ActivityFormValidator.TrainingContentsValidator(),
            ActivityFormValidator.RequiredDisabledField('training.numberOfParticipants',
            '活動内容で研修を選択した場合は、研修人数を入力してください。',
            value => value && value.value === '0'),
            ActivityFormValidator.TrainingItemsValidator(),
            ActivityFormValidator.RequiredDisabledField('purpose', '訪問目的を選択してください。',
            value => value && value.value === '0'),
            ActivityFormValidator.RequiredDisabledField('outlineExplanation', '契約概要説明を入力してください。'),
            // ActivityFormValidator.DuplicateAgentTraining(),
            // ActivityFormValidator.DuplicateComplianceTraining(),
            // ActivityFormValidator.NextVisitDateMustBeFuture(),
            ActivityFormValidator.RequiredDisabledField('interviewee.interviewee1', '面談者を選択してください。',
            value => value && value.value === '0'),
            ActivityFormValidator.RequiredDisabledField('interviewee.interviewee2', '面談者名を入力してください。'),
            ActivityFormValidator.RequiredDisabledField('interviewee.interviewee2txt', '面談者名を入力してください。'),
            ActivityFormValidator.RequiredDisabledField('interviewee.interviewername', '面談者名を入力してください。'),
            ActivityFormValidator.RequiredDisabledField('visitingName.customerName', '「顧客名取得」より選択してください。'),
            ActivityFormValidator.RequiredDisabledField('visitingName.visiting', '訪問先を選択してください。')
        ]);
    }

    /**
     * mark as Submitted
     */
    markAsSubmitted() {
        this.submitted = true;
    }

    markAsNotSubmitted() {
        this.submitted = false;
    }
    isSubmitted(): boolean {
        return this.submitted;
    }
}
applyMixins(ActivityFormGroup, [ActivityControl]);


//// validator AC

import { ActivityFormGroup, ActivityFormControl } from './activity.form.model';
import { VISIT_TYPE, ACTIVITY_INPUT, LOG_CLSF } from 'src/app/common/constant';
import { SharedDataUtil } from 'src/app/common/shareddata.util';
import { InjectorInstance } from 'src/app/app.component';
import { NGXLogger } from 'ngx-logger';

/**
 * Custom Validator function for Form Control Validation
 */
export class ActivityFormValidator {
    /**
     * Check if more than one 活動内容 select 事務所・代理店研修
     * If true, add errors into form control
     */
    static DuplicateAgentTraining() {
        return (group: ActivityFormGroup): { [key: string]: any } => {
            let count = 0;
            const visitDate = group.getActivityFormControl('visitDate');
            const activityArray = group.getFormControlArray('activityArray');
            // if form control is invisibled or visit date is not set, remove error.
            if (activityArray.isInvisible() || !visitDate.value) {
                activityArray.controls.forEach(item => {
                    (item as ActivityFormControl).removeErrors(['DuplicateAgent']);
                });
                return null;
            }
            activityArray.controls.forEach(item => {
                if (item.value && item.value.value === '2') {
                    count++;
                }
            });
            if (count > 1) {
                // There are more than one 活動内容 select 事務所・代理店研修
                activityArray.controls.forEach(item => {
                    if (item.value && item.value.value === '2') {
                        // Adding error into control that selects 事務所・代理店研修
                        InjectorInstance.get(NGXLogger).warn('There are more than one 活動内容 select 事務所・代理店研修',
                            {class: 'ActivityFormValidator', method: 'DuplicateAgentTraining', classification: LOG_CLSF.INPUT});
                        (item as ActivityFormControl).addErrors({ DuplicateAgent: { msg: '活動内容の研修は一度しか選択できません。' } });
                    } else {
                        // Removing error from control that does not select 事務所・代理店研修
                        (item as ActivityFormControl).removeErrors(['DuplicateAgent']);
                    }
                });
                return { DuplicateAgent: {} };
            } else {
                // There is only one or no 活動内容 select 事務所・代理店研修, remove error from all controls
                activityArray.controls.forEach(item => {
                    (item as ActivityFormControl).removeErrors(['DuplicateAgent']);
                });
                return null;
            }
        };
    }

    /**
     * Check if more than one 研修内容 select コンプラ研修
     * If true, add errors into form control
     */
    static DuplicateComplianceTraining() {
        return (group: ActivityFormGroup): { [key: string]: any } => {
            let count = 0;
            const visitDate = group.getActivityFormControl('visitDate');
            const controlArray = group.getFormControlArray('training.trainingContentArray');
            // if form control is invisibled or visit date is not set, remove error.
            if (controlArray.isInvisible() || !visitDate.value) {
                controlArray.controls.forEach(item => {
                    const trainingContent = item.get('trainingContent') as ActivityFormControl;
                    trainingContent.removeErrors(['DuplicateCompliance']);
                });
                return null;
            }
            controlArray.controls.forEach(item => {
                const trainingContent = item.get('trainingContent');
                if (trainingContent.value && trainingContent.value.value === '3') {
                    count++;
                }
            });
            if (count > 1) {
                // There are more than one 研修内容 select コンプラ研修
                controlArray.controls.forEach(item => {
                    const trainingContent = item.get('trainingContent') as ActivityFormControl;
                    if (trainingContent.value && trainingContent.value.value === '3') {
                        // Adding error into control that selects コンプラ研修
                        InjectorInstance.get(NGXLogger).warn('There are more than one 研修内容 select コンプラ研修',
                            {class: 'ActivityFormValidator', method: 'DuplicateComplianceTraining', classification: LOG_CLSF.INPUT});
                        trainingContent.addErrors({ DuplicateCompliance: { msg: 'コンプラ研修は複数選択できません。コンプラ研修以外を選択してください。' } });
                    } else {
                        // Removing error from control that does not select コンプラ研修
                        trainingContent.removeErrors(['DuplicateCompliance']);
                    }
                });
                return { DuplicateCompliance: {} };
            } else {
                // There is only one or no 研修内容 select コンプラ研修, remove error from all controls
                controlArray.controls.forEach(item => {
                    const trainingContent = item.get('trainingContent') as ActivityFormControl;
                    trainingContent.removeErrors(['DuplicateCompliance']);
                });
                return null;
            }
        };
    }

    /**
     * Check if there are other controls in plan form are inputted, 次回訪問予定日 must be inputted
     */
    static InputNextVisitDate() {
        return (planGroup: ActivityFormGroup): { [key: string]: any } => {
            // 次回訪問予定日 is inputted or this is Input Form, remove error
            if (planGroup.get('visitDate').value || planGroup.inputType === ACTIVITY_INPUT.INPUT) {
                planGroup.getActivityFormControl('visitDate').removeErrors(['InputNextVisitDate']);
                return null;
            }
            const activityArray = planGroup.getFormControlArray('activityArray');
            if (planGroup.get('visitTime').get('startTime').value ||
                planGroup.get('visitTime').get('endTime').value ||
                (activityArray.controls[0].value && activityArray.controls[0].value.value !== '0' &&
                    !(planGroup.root.get('inputForm').get('visitCategory').value === VISIT_TYPE.CUSTOMER_NOT_AGENCY &&
                        activityArray.controls[0].value.value === '90')) ||
                (activityArray.controls[1] && activityArray.controls[1].value && activityArray.controls[1].value.value !== '0') ||
                (activityArray.controls[2] && activityArray.controls[2].value && activityArray.controls[2].value.value !== '0') ||
                (planGroup.get('purpose') && !(planGroup.get('purpose') as ActivityFormControl).isInvisible() &&
                    planGroup.get('purpose').value && planGroup.get('purpose').value.value !== '0')) {
                // Other controls are inputted in plan form, add error
                InjectorInstance.get(NGXLogger).warn('次回訪問予定日 must be inputted',
                    {class: 'ActivityFormValidator', method: 'InputNextVisitDate', classification: LOG_CLSF.INPUT});
                planGroup.getActivityFormControl('visitDate').addErrors({ InputNextVisitDate: {} });
                return { InputNextVisitDate: {} };
            } else {
                // Other controls are not inputted in plan form, remove error
                planGroup.getActivityFormControl('visitDate').removeErrors(['InputNextVisitDate']);
                return null;
            }
        };
    }

    /**
     * Check if next visit date is later than current date
     */
    static NextVisitDateMustBeFuture() {
        return (planGroup: ActivityFormGroup): { [key: string]: any } => {
            if (planGroup.inputType === ACTIVITY_INPUT.INPUT || !planGroup.get('visitDate').value) {
                planGroup.getActivityFormControl('visitDate').removeErrors(['NextVisitDateMustBeFuture']);
                return null;
            }
            const year = parseInt(planGroup.get('visitDate').value.split('-')[0], 10);
            const month = parseInt(planGroup.get('visitDate').value.split('-')[1], 10) - 1;
            const day = parseInt(planGroup.get('visitDate').value.split('-')[2], 10);
            const inputDate = new Date(year, month, day, 0, 0, 0);
            if (inputDate.getTime() <= SharedDataUtil.getToday().getTime()) {
                InjectorInstance.get(NGXLogger).warn('next visit date is later than current date',
                    {class: 'ActivityFormValidator', method: 'NextVisitDateMustBeFuture', classification: LOG_CLSF.INPUT});
                planGroup.getActivityFormControl('visitDate').addErrors({
                    NextVisitDateMustBeFuture: { msg: '次回訪問予定日には未来日を入力してください。' }
                });
                return { NextVisitDateMustBeFuture: {} };
            } else {
                planGroup.getActivityFormControl('visitDate').removeErrors(['NextVisitDateMustBeFuture']);
                return null;
            }
        };
    }

    /**
     * Custom required validator
     * @param controlName name of required form control
     * @param message error message for required form control
     * @param checkEmptyValue function that checks if inputted value is still empty
     * @param checkException function that ignore this validation
     */
    static RequiredDisabledField(controlName: string, message: string, checkEmptyValue?: (value) => {}, checkException?: () => {}) {
        return (group: ActivityFormGroup): { [key: string]: any } => {
            const control = group.getActivityFormControl(controlName);
            if (control.isInvisible() || checkException && checkException() || !control.isRequired() ) {
                control.removeErrors(['required']);
                return control.errors;
            }
            if (control.value && control.isRequired()) {
                if (checkEmptyValue && checkEmptyValue(control.value)) {
                    InjectorInstance.get(NGXLogger).warn(`controlName=${controlName} must be inputted`,
                        {class: 'ActivityFormValidator', method: 'RequiredDisabledField', classification: LOG_CLSF.INPUT});
                    control.addErrors({ required: { msg: message } });
                    return control.errors;
                }
                control.removeErrors(['required']);
                return control.errors;
            } else {
                InjectorInstance.get(NGXLogger).warn(`controlName=${controlName} must be inputted`,
                    {class: 'ActivityFormValidator', method: 'RequiredDisabledField', classification: LOG_CLSF.INPUT});
                control.addErrors({ required: { msg: message } });
                return control.errors;
            }
        };
    }

    /**
     * Check 2 fields start time and end time must be inputted
     * and end time must be later than start time
     */
    static StartEndTimeValidator() {
        return (group: ActivityFormGroup): { [key: string]: any } => {
            // const visitDate = group.getActivityFormControl('visitDate');
            const visitTime = group.getFormControlGroup('visitTime');
            // const startTime = group.getActivityFormControl('visitTime.startTime');
            // const endTime = group.getActivityFormControl('visitTime.endTime');
            const startTimeHours = group.getActivityFormControl('visitTime.startTimeHours');
            const startTimeMin = group.getActivityFormControl('visitTime.startTimeMin');
            const endTimeHours = group.getActivityFormControl('visitTime.endTimeHours');
            const endTimeMin = group.getActivityFormControl('visitTime.endTimeMin');
            // if (!visitDate.value) {
            //     startTime.setErrors(null);
            //     endTime.setErrors(null);
            //     visitTime.setErrors(null);
            //     return visitTime.errors;
            // }
            if (startTimeHours.value && startTimeMin.value  && endTimeHours.value  && endTimeMin.value) {
                // endTime.removeErrors(['required']);
                // startTime.removeErrors(['required']);
                startTimeHours.removeErrors(['required']);
                startTimeMin.removeErrors(['required']);
                endTimeHours.removeErrors(['required']);
                endTimeMin.removeErrors(['required']);
                visitTime.removeErrors(['required']);
                // const startHour = parseInt(startTime.value.split(':')[0], 10);
                // const startMinute = parseInt(startTime.value.split(':')[1], 10);
                // const endHour = parseInt(endTime.value.split(':')[0], 10);
                // const endMinute = parseInt(endTime.value.split(':')[1], 10);
                const startHour = parseInt(startTimeHours.value, 10);
                const startMinute = parseInt(startTimeMin.value, 10);
                const endHour = parseInt(endTimeHours.value, 10);
                const endMinute = parseInt(endTimeMin.value, 10);

                if (startHour * 60 + startMinute >= endHour * 60 + endMinute) {
                    InjectorInstance.get(NGXLogger).warn(`end time must be later than start time`,
                        {class: 'ActivityFormValidator', method: 'StartEndTimeValidator', classification: LOG_CLSF.INPUT});
                    // startTime.addErrors({IncorrectTime: {}});
                    startTimeHours.addErrors({IncorrectTime: {}});
                    startTimeMin.addErrors({IncorrectTime: {}});
                    visitTime.addErrors({ IncorrectTime: { msg: '開始時間 ＜ 終了時間となるように入力してください。' } });
                } else {
                    // startTime.removeErrors(['IncorrectTime']);
                    startTimeHours.removeErrors(['IncorrectTime']);
                    startTimeMin.removeErrors(['IncorrectTime']);
                    visitTime.removeErrors(['IncorrectTime']);
                }
                return visitTime.errors;
            } else {
                if (group.getFormControlGroup('visitTime').isRequired()) {
                    if (!startTimeHours.value) {
                        startTimeHours.addErrors({required: {}});
                        return;
                    }
                    if (!startTimeMin.value) {
                        startTimeMin.addErrors({required: {}});
                        return;
                    }
                    if (!endTimeHours.value) {
                        endTimeHours.addErrors({required: {}});
                        return;
                    }
                    if (!endTimeMin.value) {
                        endTimeMin.addErrors({required: {}});
                        return;
                    }
                    InjectorInstance.get(NGXLogger).warn(`start time and end time must be inputted`,
                        {class: 'ActivityFormValidator', method: 'StartEndTimeValidator', classification: LOG_CLSF.INPUT});
                    visitTime.addErrors({ required: { msg: '訪問時間を選択してください。' } });
                    return visitTime.errors;
                } else {
                    startTimeHours.removeErrors(['required']);
                    startTimeMin.removeErrors(['required']);
                    endTimeHours.removeErrors(['required']);
                    endTimeMin.removeErrors(['required']);
                    visitTime.removeErrors(['required']);
                    return visitTime.errors;
                }
            }
        };
    }

    /**
     * Check if 活動内容 must be inputted
     */
    static ActivityArrayValidator() {
        return (group: ActivityFormGroup): { [key: string]: any } => {
            // const visitDate = group.getActivityFormControl('visitDate');
            const activityArray = group.getFormControlArray('activityArray');
            let hasError = false;
            activityArray.controls.forEach(act => {
                const activity = (act as ActivityFormControl);
                if (activity.isInvisible() || act.value && act.value.value !== '0'  || !activity.isRequired()) {
                    activity.removeErrors(['required']);
                } else {
                    InjectorInstance.get(NGXLogger).warn(`活動内容 must be inputted`,
                        {class: 'ActivityFormValidator', method: 'ActivityArrayValidator', classification: LOG_CLSF.INPUT});
                    hasError = true;
                    const message = group.inputType === ACTIVITY_INPUT.INPUT ? '活動内容を選択してください。' :
                        '次回訪問予定日を入力した場合は、次回行動予定を選択してください。';
                    activity.addErrors({ required: { msg: message } });
                }
            });
            if (hasError) {
                return { required: {} };
            } else {
                return null;
            }
        };
    }

    /**
     * Check if 研修内容 must be inputted
     */
    static TrainingContentsValidator() {
        return (group: ActivityFormGroup): { [key: string]: any } => {
            // const visitDate = group.getActivityFormControl('visitDate');
            const trainingContentArray = group.getFormControlArray('training.trainingContentArray');
            let hasError = false;
            trainingContentArray.controls.forEach(content => {
                const trainingContent = content.get('trainingContent') as ActivityFormControl;
                if (trainingContent.isInvisible() || trainingContent.value && trainingContent.value.value !== '0'
                || !trainingContent.isRequired() ) {
                    trainingContent.removeErrors(['required']);
                } else {
                    InjectorInstance.get(NGXLogger).warn(`研修内容 must be inputted`,
                        {class: 'ActivityFormValidator', method: 'TrainingContentsValidator', classification: LOG_CLSF.INPUT});
                    hasError = true;
                    trainingContent.addErrors({ required: { msg: '活動内容で研修を選択した場合は、研修内容を入力してください。' } });
                }
            });
            if (hasError) {
                return { required: {} };
            } else {
                return null;
            }
        };
    }

    /**
     * Check if there is a checked 研修項目 at least
     */
    static TrainingItemsValidator() {
        return (group: ActivityFormGroup): { [key: string]: any } => {
            // const visitDate = group.getActivityFormControl('visitDate');
            const trainingItems = group.getFormControlArray('training.trainingItems');
            let firstItem: ActivityFormControl;
            if (trainingItems.controls && trainingItems.controls.length > 0) {
                firstItem = trainingItems.controls[0] as ActivityFormControl;
            }
            if (trainingItems.isInvisible() || trainingItems.controls.some(i => i.value) || ! trainingItems.isRequired()) {
                trainingItems.removeErrors(['required']);
                if (firstItem) {
                    firstItem.removeErrors(['required']);
                }
            } else {
                InjectorInstance.get(NGXLogger).warn(`研修項目 must be inputted`,
                    {class: 'ActivityFormValidator', method: 'TrainingItemsValidator', classification: LOG_CLSF.INPUT});
                trainingItems.addErrors({ required: { msg: 'コンプラ研修の研修項目が選択されていません。研修項目を選択のうえ、登録ボタンを押してください。' } });
                if (firstItem) {
                    firstItem.addErrors({required: {}});
                }
            }
            return trainingItems.errors;
        };
    }
}


/////////////// COMPONENT

import {
  Component, OnInit, Input, OnChanges, SimpleChanges,
  Output, EventEmitter, OnDestroy, ViewChild, ElementRef, ChangeDetectorRef, AfterViewInit, NgZone
} from '@angular/core';
import {
  ACTIVITY_INPUT, VISIT_TYPE, SECTION, COMMON, INPUT_DATE, TRANCODE,
  COMMON_ONLINE_SERVICE_NAME, SpeechMode, OPERATION_TYPE, LOG_CLSF, TIMES, MINUTES, COMPONENT
} from 'src/app/common/constant';
import { ActivityFormGroup, FormControlGroup, ActivityFormControl, FormControlArray } from './activity.form.model';
import { Router } from '@angular/router';
import { LoadingService } from '../loading/loading.service';
import { Validators } from '@angular/forms';
import { G612FormModelService } from '../g612/g612.form.model.service';
import { SharedData } from 'src/app/share/shared-data';
import { Agent } from 'src/app/model/agent.model';
import { BuisinessUtility } from 'src/app/share/buisiness-utility';
import { SharedDataUtil } from 'src/app/common/shareddata.util';
import { DatePipe } from '@angular/common';
import { WebCommunication } from 'src/app/share/web-communication';
import { Subscription } from 'rxjs';
import { Interviewee } from 'src/app/model/interviewee.model';
import { SpeechRecognitionService } from 'src/app/plugin/speech-recognition.service';
import { FullwidthValidator } from 'src/app/validator/fullwidth.validator';
import { TrainingReader } from 'src/app/share/training-reader';
import { TrainingOptionModel } from 'src/app/model/training/training.option.model';
import { DialogComponent, DialogType } from '../dialog/dialog.component';
import { InjectorInstance } from 'src/app/app.component';
import { MatDialog } from '@angular/material';
import { NGXLogger } from 'ngx-logger';
import {
  faAddressBook,
  faCalendarAlt,
  faClock,
  faListAlt,
  faMapMarkerAlt,
  faUserCircle,
  faUserFriends,
  faRunning,
  faInfoCircle,
  faUserPlus,
  faBookReader,
  faClipboard,
  faTasks,
  faHandPointUp,
  faExclamationCircle,
  faCaretDown
} from '@fortawesome/free-solid-svg-icons';
import { DateEvent } from 'src/app/model/dateevent.model';
import { DatepickerMaterialComponent } from '../datepicker-material/datepicker-material.component';
import { AppComponentService } from 'src/app/app.component.service';

@Component({
  selector: 'app-activity',
  templateUrl: './activity.component.html',
  styleUrls: ['./activity.component.css']
})
export class ActivityComponent implements OnInit, OnChanges, OnDestroy, AfterViewInit {


  AGENCY: number = VISIT_TYPE.AGENCY;
  CUSTOMER_AGENCY: number = VISIT_TYPE.CUSTOMER_AGENCY;
  CUSTOMER_NOT_AGENCY: number = VISIT_TYPE.CUSTOMER_NOT_AGENCY;
  OTHER: number = VISIT_TYPE.OTHER;
  TimesOption = TIMES;
  MinutesOption = MINUTES;
  @Input()
  activityInput: ACTIVITY_INPUT;

  @Input()
  openMode: OPERATION_TYPE;

  @Input()
  parentForm: FormControlGroup;

  @Output()
  getCustomerEvent = new EventEmitter<any>();

  @Output()
  maskNotSubmitted = new EventEmitter();

  @ViewChild('datePicker') datePicker: DatepickerMaterialComponent;

  @ViewChild('voiceBtn')
  voiceBtn: ElementRef;

  @ViewChild('interviewee2')
  interviewee2: ElementRef;

  @ViewChild('interviewee2txt')
  interviewee2txt: ElementRef;

  @ViewChild('numberOfParticipants')
  numberOfParticipants: ElementRef;

  @ViewChild('startTimeHours')
  startTimeHours: ElementRef;

  @ViewChild('startTimeMin')
  startTimeMin: ElementRef;

  @ViewChild('endTimeHours')
  endTimeHours: ElementRef;

  @ViewChild('endTimeMin')
  endTimeMin: ElementRef;

  visitCat: ActivityFormControl;

  activityForm: ActivityFormGroup;

  activities: FormControlArray;

  trainingContents: FormControlArray;

  formModelSubscription: Subscription;

  triggerSubscription: Subscription;

  speechSubscription: Subscription;

  oldFiscalYear: number;

  calendarAltIcon = faCalendarAlt;
  clockIcon = faClock;
  listAltIcon = faListAlt;
  mapMarkerAltIcon = faMapMarkerAlt;
  userCircleIcon = faUserCircle;
  userFriendsIcon = faUserFriends;
  runningIcon = faRunning;
  infoCircleIcon = faInfoCircle;
  userPlusIcon = faUserPlus;
  bookReaderIcon = faBookReader;
  clipboardIcon = faClipboard;
  tasksIcon = faTasks;
  handPointUpIcon = faHandPointUp;
  exclamationCircleIcon = faExclamationCircle;
  caretDownIcon = faCaretDown;
  addressBookIcon = faAddressBook;
  isDisableControl: boolean;
  isAddDisableVisitDate: boolean;
  private selectedTrainingContent  = '';
  public countConcreteContent = 0;
  public activityArrayFakeDisable = false;

  constructor(
    private ref: ChangeDetectorRef, private loading: LoadingService, private webComunication: WebCommunication,
    private formModelService: G612FormModelService, private datePipe: DatePipe,
    public speechService: SpeechRecognitionService, private trainingReader: TrainingReader,
    private appComSer: AppComponentService,
    private ngZone: NgZone,
    private logger: NGXLogger) {
    this.logger.info('', { class: 'ActivityComponent', method: 'constructor', classification: LOG_CLSF.METHOD_START });
    this.formModelSubscription = formModelService.getFormModel().subscribe(data => {
      // This subcriber processes for plan form only.
      // It will be triggerred when changing visit category in input form
      if (this.activityInput === ACTIVITY_INPUT.PLAN) {
        this.parentForm = data;
        this.visitCat = this.parentForm.getActivityFormControl('inputForm.visitCategory');
        this.packMatching();
        this.controlItemsDisplay();
      }
    });
    this.triggerSubscription = formModelService.getTriggerDisplay().subscribe(data => {
      this.controlTrainingContentDisplay();
    });
    this.catchEvent();
    this.logger.info('', { class: 'ActivityComponent', method: 'constructor', classification: LOG_CLSF.METHOD_END });
  }

  ngOnInit() {
  }

  ngAfterViewInit() {
    setTimeout(() => {
      this.reInitialValidation();
      this.countConcreteContent = this.activityForm.getActivityFormControl('concreteContent').value.length || 0;
    }, 0);
  }

  /**
   * OnDestroy hook of activity component.
   */
  ngOnDestroy(): void {
    this.logger.info('', { class: 'ActivityComponent', method: 'ngOnDestroy', classification: LOG_CLSF.METHOD_START });
    this.formModelSubscription.unsubscribe();
    this.triggerSubscription.unsubscribe();
    this.speechSubscription.unsubscribe();
    this.logger.info('', { class: 'ActivityComponent', method: 'ngOnDestroy', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * OnChange hook of activity component. It will be called when G612 changes input parameters
   * @param changes contains old and new value of input parameters
   */
  ngOnChanges(changes: SimpleChanges) {
    this.logger.info(`activityInput=${this.activityInput}`,
      { class: 'ActivityComponent', method: 'ngOnChanges', classification: LOG_CLSF.METHOD_START });
    if (this.activityInput === ACTIVITY_INPUT.INPUT) {
      this.activityForm = changes.parentForm.currentValue.get('inputForm');
      const visitDate = SharedData.getInstance().getCommonData(SECTION.G610, COMMON.IG6101W);
      this.activityForm.getActivityFormControl('visitDate').setValue(this.datePipe.transform(visitDate, 'yyyy-MM-dd'));
    } else if (this.activityInput === ACTIVITY_INPUT.PLAN) {
      this.activityForm = changes.parentForm.currentValue.get('planForm');
    }
    this.activities = this.activityForm.getFormControlArray('activityArray');
    this.trainingContents = this.activityForm.getFormControlArray('training.trainingContentArray');
    this.visitCat = changes.parentForm.currentValue.get('inputForm').get('visitCategory');

    this.packMatching();
    this.getAgentList();
    this.logger.info('', { class: 'ActivityComponent', method: 'ngOnChanges', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Control display (Visible/Invisible, Enable/Disable) all items of activity
   */
  controlItemsDisplay() {
    this.logger.info(``, { class: 'ActivityComponent', method: 'controlItemsDisplay', classification: LOG_CLSF.METHOD_START });
    if (this.activityForm) {
      const isPlan = this.activityInput === ACTIVITY_INPUT.PLAN;
      const isEdit = this.openMode === OPERATION_TYPE.EDIT;
      const isView = this.openMode === OPERATION_TYPE.VIEW;
      this.isAddDisableVisitDate = false;
      const isAdd = this.openMode === OPERATION_TYPE.ADD;
      this.logger.trace(`isPlan=${isPlan}, isEdit=${isEdit}, isView=${isView}`,
        { class: 'ActivityComponent', method: 'controlItemsDisplay' });
      // this.activityForm.getActivityFormControl('visitDate').disableControl(isView);
      // this.activityForm.getActivityFormControl('visitTime.startTime').disableControl(isView);
      // this.activityForm.getActivityFormControl('visitTime.endTime').disableControl(isView);
      if (isEdit) {
        this.isDisableControl = false;
      } else if (isView) {
        this.isDisableControl = true;
      } else if (isAdd) {
        this.isAddDisableVisitDate = true;
      }
      this.activityForm.getActivityFormControl('visitTime.startTimeHours').disableControl(isView);
      this.activityForm.getActivityFormControl('visitTime.startTimeMin').disableControl(isView);
      this.activityForm.getActivityFormControl('visitTime.endTimeHours').disableControl(isView);
      this.activityForm.getActivityFormControl('visitTime.endTimeMin').disableControl(isView);
      this.activityForm.getActivityFormControl('visitCategory').invisible = isPlan;
      this.activityForm.getActivityFormControl('visitCategory').disableControl(this.isDisableControl);
      // In case plan visitingName group will be invisibled. All children will be invisibled too.
      this.activityForm.getFormControlGroup('visitingName').invisible = isPlan;
      this.activityForm.getActivityFormControl('visitingName.visiting').invisible =
        this.visitCat.value === this.CUSTOMER_NOT_AGENCY || this.visitCat.value === this.OTHER;
      this.activityForm.getActivityFormControl('visitingName.visiting').disableControl(isView);
      this.activityForm.getActivityFormControl('visitingName.customerName').invisible =
        this.visitCat.value === this.AGENCY || this.visitCat.value === this.OTHER;
      this.activityForm.getActivityFormControl('visitingName.customerName').disableControl(true, true);
      this.activityForm.getActivityFormControl('visitingName.getCustomerNameBtn').invisible =
      this.visitCat.value === this.AGENCY || this.visitCat.value === this.OTHER || isView;
      this.activityForm.getActivityFormControl('visitingName.visitDestinationName').invisible =
        this.visitCat.value !== this.OTHER;
      this.activityForm.getActivityFormControl('visitingName.visitDestinationName').disableControl(
        isView && this.visitCat.value === this.OTHER);
      // In case plan interviewee group will be invisibled. All children will be invisibled too.
      this.activityForm.getFormControlGroup('interviewee').invisible = isPlan;
      this.activityForm.getActivityFormControl('interviewee.interviewee1').disableControl(
        this.visitCat.value === this.CUSTOMER_AGENCY || this.visitCat.value === this.OTHER || isView, true);
      this.activityForm.getActivityFormControl('interviewee.interviewername').invisible =
        this.visitCat.value === this.AGENCY || this.visitCat.value === this.OTHER;
      this.activityForm.getActivityFormControl('interviewee.interviewername').disableControl(isView);
      this.activityForm.getActivityFormControl('interviewee.interviewee2').invisible =
        this.visitCat.value !== this.AGENCY;
      this.activityForm.getActivityFormControl('interviewee.interviewee2').disableControl(isView);
      this.activityForm.getActivityFormControl('interviewee.interviewee2txt').invisible = true;
      this.activityForm.getActivityFormControl('interviewee.interviewee2txt').disableControl(isView);
      // this.activityForm.getActivityFormControl('interviewee.displayEmployeeBtn').invisible =
      //   this.visitCat.value !== this.AGENCY || isView;
      this.activityForm.getActivityFormControl('companion').invisible = this.visitCat.value === this.OTHER || isPlan;
      this.activityForm.getActivityFormControl('companion').disableControl(isView);
      this.activityForm.getActivityFormControl('minusBtn').invisible =
        this.visitCat.value === this.CUSTOMER_AGENCY || this.visitCat.value === this.CUSTOMER_NOT_AGENCY || isEdit || isView;
      this.activityForm.getActivityFormControl('plusBtn').invisible =
        this.visitCat.value === this.CUSTOMER_AGENCY || this.visitCat.value === this.CUSTOMER_NOT_AGENCY || isEdit || isView;
      this.activityForm.getActivityFormControl('purpose').invisible =
        this.visitCat.value !== this.CUSTOMER_AGENCY && this.visitCat.value !== this.CUSTOMER_NOT_AGENCY;
      this.activityForm.getActivityFormControl('purpose').disableControl(isView);
      this.activityForm.getActivityFormControl('outlineExplanation').invisible =
        this.visitCat.value !== this.CUSTOMER_AGENCY || isPlan;
      this.activityForm.getActivityFormControl('outlineExplanation').disableControl(isView);
      this.activityForm.getActivityFormControl('concreteContent').invisible = isPlan;
      this.activityForm.getActivityFormControl('concreteContent').disableControl(isView);
      this.activityForm.getActivityFormControl('voiceBtn').invisible = isView;
      this.activityArrayFakeDisable = this.visitCat.value === this.CUSTOMER_NOT_AGENCY;

      this.controlTrainingContentDisplay();
      if (!isPlan) {
        this.controlGetIntervieweeDisplay(false);
        this.controlGetCustomerDisplay();
      }
      this.reInitialValidation();
    }
    this.logger.info(``, { class: 'ActivityComponent', method: 'controlItemsDisplay', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Control display (Visible/Invisible, Enable/Disable) training content items of activity
   */
  controlTrainingContentDisplay(event?) {

    if (this.visitCat.value === this.AGENCY) {
      this.selectedTrainingContent = '';
      if (event) {
        this.selectedTrainingContent = event[event.selectedIndex || 0].id || '' ;
        this.reInitialValidation();
      }
    }
    this.logger.info(``, { class: 'ActivityComponent', method: 'controlTrainingContentDisplay', classification: LOG_CLSF.METHOD_START });

    if (this.activities) {
      const oldInvisibleStatus = this.activityForm.getFormControlGroup('training').invisible;
      // Training group will be visibled only if 代理店 is selected and 事務所・代理店研修 is selected in 活動内容
      // and 訪問年月日/次回訪問予定日 is set
      this.activityForm.getFormControlGroup('training').invisible =
        this.visitCat.value !== this.AGENCY || this.activities.controls.find(ele => {
          return ele.value && ele.value.value === '2';
        }) == null || !this.activityForm.getActivityFormControl('visitDate').value;
      // 活動内容 will be disabled if 顧客(代理店以外) is selected or in View Detail mode
      this.activities.controls.forEach(ele => {
        (ele as ActivityFormControl).disableControl(this.openMode === OPERATION_TYPE.VIEW);
      });
      // In case status of Training group is changed from invisible to visible or NOT Add mode
      // then clear and control display Training form
      if (oldInvisibleStatus && !this.activityForm.getFormControlGroup('training').invisible || this.openMode !== OPERATION_TYPE.ADD) {
        this.activityForm.getActivityFormControl('training.numberOfParticipants').disableControl(this.openMode === OPERATION_TYPE.VIEW);
        this.activityForm.getActivityFormControl('training.trainingContentMinusBtn').invisible =
          this.openMode === OPERATION_TYPE.EDIT || this.openMode === OPERATION_TYPE.VIEW;
        this.activityForm.getActivityFormControl('training.trainingContentPlusBtn').invisible =
          this.openMode === OPERATION_TYPE.EDIT || this.openMode === OPERATION_TYPE.VIEW;
        this.controlTrainingItemsDisplay();
        this.clearTrainingForm();
      }
      // In case status of Training group is changed from visible to invisible, clear Training form
      if (!oldInvisibleStatus && this.activityForm.getFormControlGroup('training').invisible) {
        this.clearTrainingForm();
      }
    }


    this.logger.info(``, { class: 'ActivityComponent', method: 'controlTrainingContentDisplay', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Control display (Visible/Invisible, Enable/Disable) training items of activity
   */
  controlTrainingItemsDisplay() {
    this.logger.info(``, { class: 'ActivityComponent', method: 'controlTrainingItemsDisplay', classification: LOG_CLSF.METHOD_START });
    if (this.trainingContents) {
      // 研修内容 and 備考 will be disable in View Detail mode
      this.trainingContents.controls.forEach(control => {
        (control as FormControlGroup).getActivityFormControl('trainingContent').disableControl(this.openMode === OPERATION_TYPE.VIEW);
        (control as FormControlGroup).getActivityFormControl('remarks').disableControl(this.openMode === OPERATION_TYPE.VIEW);
      });
      const trainingItems = this.activityForm.getFormControlArray('training.trainingItems');
      const oldInvisibleStatus = trainingItems.invisible;
      // Training Items will be visibled only of 代理店 is selected and コンプラ研修 is selected in 研修内容
      trainingItems.invisible = this.visitCat.value !== this.AGENCY ||
        this.trainingContents.controls.find(ele => {
          if (ele && ele.get('trainingContent')) {
            return ele.get('trainingContent').value &&
              ele.get('trainingContent').value.value === '3' &&
              ele.get('trainingContent').value.description === 'コンプラ研修';
          }
          return false;
        }) == null;
      // In case status of Training Items group is changed from invisible to visible or NOT Add mode
      // then clear and control display Training Items form
      if (oldInvisibleStatus && !trainingItems.invisible || this.openMode !== OPERATION_TYPE.ADD) {
        trainingItems.removeAll();
        const visitDate = new Date(this.activityForm.getActivityFormControl('visitDate').value);
        const items = this.getTrainingItems(visitDate);
        // if (items && items.length > 0) {
        items.forEach((ele, index) => {
          const itemControl = new ActivityFormControl(false, false, false, null, `IG6N00${index + 1}${this.activityInput}`, true);
          itemControl.valueObj = { value: ele.id, label: ele.getDisplayName() };
          itemControl.disableControl(ele.id === '0' || this.openMode === OPERATION_TYPE.VIEW);
          trainingItems.push(itemControl);
        });
        // } else {
        //   trainingItems.invisible = true;
        // }
      }
      // In case status of Training Items group is changed from visible to invisible, clear Training Items
      if (!oldInvisibleStatus && trainingItems.invisible) {
        trainingItems.removeAll();
      }
    }
    this.logger.info(``, { class: 'ActivityComponent', method: 'controlTrainingItemsDisplay', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Control display (Visible/Invisible, Enable/Disable) Interviewee items
   */
  controlGetIntervieweeDisplay(getInterviewee: boolean) {
    this.logger.info(``, { class: 'ActivityComponent', method: 'controlGetIntervieweeDisplay', classification: LOG_CLSF.METHOD_START });
    const visiting = this.activityForm.getActivityFormControl('visitingName.visiting');
    const interviewee1 = this.activityForm.getActivityFormControl('interviewee.interviewee1');
    const visitingSelected = visiting.value && visiting.value.nameKanji.trim() !== '';
    const intervieweeSelected = interviewee1.value &&
      interviewee1.value.value !== '0' && interviewee1.value.value !== '4' &&
      interviewee1.value.value !== '5' && interviewee1.value.value !== '6' &&
      interviewee1.value.value !== '7' && interviewee1.value.value !== '8' &&
      interviewee1.value.value !== '9' && interviewee1.value.value !== '26';
    this.activityForm.getActivityFormControl('interviewee.interviewee2').disableControl(
      !visitingSelected, true);
    // this.activityForm.getActivityFormControl('interviewee.displayEmployeeBtn').disableControl(
    //   !visitingSelected || !intervieweeSelected);
    if (getInterviewee && visitingSelected && intervieweeSelected) {
      this.getIntervieweeList();
    }
    this.logger.info(``, { class: 'ActivityComponent', method: 'controlGetIntervieweeDisplay', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Control display (Visible/Invisible, Enable/Disable) Customer items
   */
  controlGetCustomerDisplay() {
    this.logger.info(``, { class: 'ActivityComponent', method: 'controlGetCustomerDisplay', classification: LOG_CLSF.METHOD_START });
    const visiting = this.activityForm.getActivityFormControl('visitingName.visiting');
    const disableGetCustomer = this.visitCat.value === this.CUSTOMER_AGENCY &&
      (!visiting.value || visiting.value.nameKanji.trim() === '' || visiting.value.classification === '2');
    this.activityForm.getActivityFormControl('visitingName.getCustomerNameBtn').disableControl(disableGetCustomer);
    this.logger.info(``, { class: 'ActivityComponent', method: 'controlGetCustomerDisplay', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Preparing data to transit to screen G616
   */
  transitToG616() {
    this.logger.info(``, { class: 'ActivityComponent', method: 'transitToG616', classification: LOG_CLSF.METHOD_START });
    this.loading.startLoading();
    let visitDestination = '';
    if (this.visitCat.value === this.CUSTOMER_AGENCY) {
      if (this.activityForm.getActivityFormControl('visitingName.visiting').value) {
        visitDestination = this.activityForm.getActivityFormControl('visitingName.visiting').value.code;
      }
    }
    // Put data to shared commondata and emit event to G612
    SharedData.getInstance().putCommonData(SECTION.G616, COMMON.IK0011, visitDestination);
    this.getCustomerEvent.emit();
    this.logger.info(``, { class: 'ActivityComponent', method: 'transitToG616', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Get interviewee list for select-editable 面談者リスト
   */
  getIntervieweeList() {
    this.logger.info(``, { class: 'ActivityComponent', method: 'getIntervieweeList', classification: LOG_CLSF.METHOD_START });
    this.loading.startLoading();
    this.activityForm.getActivityFormControl('interviewee.interviewee2').setValue('');
    this.activityForm.getActivityFormControl('interviewee.interviewee2').optionList = [];
    this.activityForm.getActivityFormControl('interviewee.interviewee2txt').invisible = true;
    this.activityForm.getActivityFormControl('interviewee.interviewee2txt').setValue('');
    if (this.interviewee2) {
      this.interviewee2.nativeElement.value = '';
    }
    const visiting = this.activityForm.getActivityFormControl('visitingName.visiting');
    SharedData.getInstance().putSendBody(SECTION.G612, TRANCODE.T2G612S3, {
      IK0011S: visiting.value ? visiting.value.code : ''
    });
    this.logger.info(`SECTION=${SECTION.G612}, TRANCODE=${TRANCODE.T2G612S3}`,
      { class: 'ActivityComponent', method: 'getIntervieweeList', classification: LOG_CLSF.START });
    this.webComunication.sendRecv(SECTION.G612, COMMON_ONLINE_SERVICE_NAME, TRANCODE.T2G612S3).subscribe(result => {
      SharedDataUtil.getBodyMessage(result, SECTION.G612, TRANCODE.T2G612S3, () => {
        const body = SharedData.getInstance().getRecvBody(SECTION.G612, TRANCODE.T2G612S3);
        if (body != null && body.G210TBL2 != null && body.G210TBL2.length > 0) {
          const interviewee = this.activityForm.getActivityFormControl('interviewee.interviewee2');
          interviewee.optionList = body.G210TBL2.map(ele => {
            return new Interviewee(ele[0], ele[1], ele[2], ele[3]);
          });
          // interviewee.setValue(interviewee.optionList[0].picNameKanji);
          // interviewee.valueObj = interviewee.optionList[0];

          // if (interviewee.optionList && interviewee.optionList.length > 1) {
          // this.ref.detectChanges();
          // this.interviewee2.nativeElement.dispatchEvent(new MouseEvent('mousedown', {bubbles: true}));
          // }
          const intervieweeValue = interviewee.value;
          if (intervieweeValue !== 'その他(手入力)' && this.openMode !== OPERATION_TYPE.ADD) {
            interviewee.selectValueInList(ele => {
              if (ele && ele.picNameKanji) {
                return intervieweeValue === ele.picNameKanji;
              }
            }, 'その他(手入力)');
            if (interviewee.value === 'その他(手入力)') {
              this.activityForm.getActivityFormControl('interviewee.interviewee2txt').invisible = false;
              this.activityForm.getActivityFormControl('interviewee.interviewee2txt').setValue(intervieweeValue);
              SharedData.getInstance().putCommonData(SECTION.G612, COMMON.MendanEdit, true);
            } else {
              SharedData.getInstance().putCommonData(SECTION.G612, COMMON.MendanEdit, false);
            }
          }
        }
        this.loading.stopLoading();
        this.logger.info(`SECTION=${SECTION.G612}, TRANCODE=${TRANCODE.T2G612S3}`,
          { class: 'ActivityComponent', method: 'getIntervieweeList', classification: LOG_CLSF.END });
      });
    });
    this.logger.info(``, { class: 'ActivityComponent', method: 'getIntervieweeList', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Handler of minus button of 活動内容
   */
  reduceActivity() {
    this.logger.info(``, { class: 'ActivityComponent', method: 'reduceActivity', classification: LOG_CLSF.METHOD_START });
    if (this.activities.length > 1) {
      this.activities.removeAt(this.activities.length - 1);
      this.controlTrainingContentDisplay();
    }
    this.logger.info(``, { class: 'ActivityComponent', method: 'reduceActivity', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Handler of plus button of 活動内容
   */
  addActivity() {
    this.logger.info(``, { class: 'ActivityComponent', method: 'addActivity', classification: LOG_CLSF.METHOD_START });
    if (this.activities.length < 3) {
      this.activities.push(new ActivityFormControl(false, false, this.activities.optionList[0], null,
        `IG6135${this.activities.length}${this.activityInput}`, true));
      this.controlTrainingContentDisplay();
    }
    this.logger.info(``, { class: 'ActivityComponent', method: 'addActivity', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Handler of minus button of 研修内容
   */
  reduceTrainingContent() {
    this.logger.info(``, { class: 'ActivityComponent', method: 'reduceTrainingContent', classification: LOG_CLSF.METHOD_START });
    if (this.trainingContents.length > 1) {
      this.trainingContents.removeAt(this.trainingContents.length - 1);
      this.controlTrainingItemsDisplay();
    }
    this.logger.info(``, { class: 'ActivityComponent', method: 'reduceTrainingContent', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Handler of plus button of 研修内容
   */
  addTrainingContent() {
    this.logger.info(``, { class: 'ActivityComponent', method: 'addTrainingContent', classification: LOG_CLSF.METHOD_START });
    if (this.trainingContents.length < 5) {
      this.trainingContents.push(new FormControlGroup(false, {
        trainingContent: new ActivityFormControl(false, false, this.trainingContents.optionList[0], null,
          `IG6141${this.trainingContents.length + 1}${this.activityInput}`, true),
        remarks: new ActivityFormControl(false, false, null, Validators.compose([
          FullwidthValidator.fullwidth(), Validators.maxLength(15)
        ]), `IG6142${this.trainingContents.length + 1}${this.activityInput}`)
      }));
      this.controlTrainingItemsDisplay();
    }
    this.logger.info(``, { class: 'ActivityComponent', method: 'addTrainingContent', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Handler of change event of 訪問区分
   */
  onChangeVisitCategory() {

    this.reInitialValidation();
    this.logger.info(``, { class: 'ActivityComponent', method: 'onChangeVisitCategory', classification: LOG_CLSF.METHOD_START });
    SharedData.getInstance().putCommonData(SECTION.G612, COMMON.IG6121,
      this.activityForm.getActivityFormControl('visitCategory').value as string);
    SharedData.getInstance().putCommonData(SECTION.G616, COMMON.Store_IF0111, '');
    // In case Input form, it will trigger this change to Plan form
    if (this.activityInput === ACTIVITY_INPUT.INPUT) {
      this.formModelService.setFormModel(this.parentForm);
    }
    this.packMatching();
    this.controlItemsDisplay();
    if (this.openMode === OPERATION_TYPE.EDIT &&
    (this.visitCat.value === this.CUSTOMER_AGENCY || this.visitCat.value === this.CUSTOMER_NOT_AGENCY)) {
      this.activityForm.getActivityFormControl('visitingName.getCustomerNameBtn').invisible = false ;
    }
    this.logger.info(``, { class: 'ActivityComponent', method: 'onChangeVisitCategory', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Handler of change event of Editable Select 面談者リスト
   * @param isSelect True if value is changed from select, False if value is changed from input
   * @param selectedIndex (optional) if isSelect is True, index of selected item
   */
  onChangeEditableSelect(isSelect, selectedIndex?) {
    this.logger.info(``, { class: 'ActivityComponent', method: 'onChangeEditableSelect', classification: LOG_CLSF.METHOD_START });
    if (isSelect) {
      const interviewee2 = this.activityForm.getActivityFormControl('interviewee.interviewee2');
      if (selectedIndex < interviewee2.optionList.length) {
        this.activityForm.getActivityFormControl('interviewee.interviewee2txt').invisible = true;
        this.activityForm.getActivityFormControl('interviewee.interviewee2txt').setValue('');
        // interviewee2.setValue(interviewee2.optionList[selectedIndex].picNameKanji);
        interviewee2.valueObj = interviewee2.optionList[selectedIndex];
        SharedData.getInstance().putCommonData(SECTION.G612, COMMON.MendanEdit, false);
      } else {
        this.activityForm.getActivityFormControl('interviewee.interviewee2txt').invisible = false;
        this.ref.detectChanges();
        this.interviewee2txt.nativeElement.focus();
      }
    } else {
      // this.interviewee2.nativeElement.value = '';
      this.activityForm.getActivityFormControl('interviewee.interviewee2').valueObj = {
        employeeDisplay: '',
        employeeCode: ''
      };
      SharedData.getInstance().putCommonData(SECTION.G612, COMMON.MendanEdit, true);
    }
    this.logger.info(``, { class: 'ActivityComponent', method: 'onChangeEditableSelect', classification: LOG_CLSF.METHOD_END });
  }

  onChangeEditableSelectParticipantNo(isSelect, selectedIndex?) {
    this.logger.info(``,
      { class: 'ActivityComponent', method: 'onChangeEditableSelectParticipantNo', classification: LOG_CLSF.METHOD_START });
    if (isSelect) {
      const numberOfParticipants = this.activityForm.getActivityFormControl('training.numberOfParticipants');
      numberOfParticipants.setValue(selectedIndex);
    } else {
      this.numberOfParticipants.nativeElement.value = '';
    }
    this.logger.info(``,
      { class: 'ActivityComponent', method: 'onChangeEditableSelectParticipantNo', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Handler of change event of 訪問先リスト
   * Clear value of 顧客名 and 面談者リスト and control display of Interviewee and Customer group
   */
  onChangeVisiting() {
    this.logger.info(``, { class: 'ActivityComponent', method: 'onChangeVisiting', classification: LOG_CLSF.METHOD_START });
    this.activityForm.getActivityFormControl('visitingName.customerName').clear('');
    this.activityForm.getActivityFormControl('visitingName.customerName').valueObj = undefined;
    this.activityForm.getActivityFormControl('interviewee.interviewee2').setValue('');
    this.activityForm.getActivityFormControl('interviewee.interviewee2').optionList = [];
    this.activityForm.getActivityFormControl('interviewee.interviewee2txt').invisible = true;
    this.activityForm.getActivityFormControl('interviewee.interviewee2txt').setValue('');
    this.controlGetIntervieweeDisplay(true);
    this.controlGetCustomerDisplay();
    this.logger.info(``, { class: 'ActivityComponent', method: 'onChangeVisiting', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Handler of change event of 面談者
   * Clear value of 面談者リスト and control display of Interviewee group
   */
  onChangeInterviewClsf() {
    this.logger.info(``, { class: 'ActivityComponent', method: 'onChangeInterviewClsf', classification: LOG_CLSF.METHOD_START });
    this.activityForm.getActivityFormControl('interviewee.interviewee2').setValue('');
    this.activityForm.getActivityFormControl('interviewee.interviewee2').optionList = [];
    this.activityForm.getActivityFormControl('interviewee.interviewee2txt').invisible = true;
    this.activityForm.getActivityFormControl('interviewee.interviewee2txt').setValue('');
    this.controlGetIntervieweeDisplay(true);
    this.logger.info(``, { class: 'ActivityComponent', method: 'onChangeInterviewClsf', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Handler of change event of 次回訪問予定日
   */
  onChangeVisitDate(event) {
    this.logger.info(``, { class: 'ActivityComponent', method: 'onChangeVisitDate', classification: LOG_CLSF.METHOD_START });

    // 次回訪問予定日 is changed only if this is Plan form
    // if (this.activityInput === ACTIVITY_INPUT.PLAN) {
    // Control displaying of training group
    const dateString = this.datePipe.transform(event, 'yyyy-MM-dd');
    this.activityForm.getActivityFormControl('visitDate').setValue(dateString);

    const visitDateOld = this.datePipe.transform(SharedData.getInstance().getCommonData(SECTION.G610, COMMON.IG6101W), 'yyyy-MM-dd');

    SharedData.getInstance().putCommonData(SECTION.G612,
                                           COMMON.DELNEW,
                                           (visitDateOld !== dateString) && (this.openMode === OPERATION_TYPE.EDIT));
    this.datePicker.IsShowDatepickerContent = false;
    this.packMatching(true);
    //this.controlItemsDisplay();
    const trainingItems = this.activityForm.getFormControlArray('training.trainingItems');
    // If 次回訪問予定日 is set and training items is visibled, rebuild training items list
    if (this.activityForm.getActivityFormControl('visitDate').value && !trainingItems.isInvisible()) {
      const visitDate = new Date(this.activityForm.getActivityFormControl('visitDate').value);
      let fiscalYear = visitDate.getFullYear();
      if (visitDate.getMonth() >= 0 && visitDate.getMonth() < 3) {
        fiscalYear--;
      }
      // If change to another fiscal year, rebuild training items list
      if (fiscalYear !== this.oldFiscalYear) {
        this.oldFiscalYear = fiscalYear;
        trainingItems.removeAll();
        const items = this.getTrainingItems(visitDate);
        if (items && items.length > 0) {
          items.forEach((ele, index) => {
            const itemControl = new ActivityFormControl(false, false, false, null, `IG6N00${index + 1}${this.activityInput}`, true);
            itemControl.valueObj = { value: ele.id, label: ele.getDisplayName() };
            itemControl.disableControl(ele.id === '0' || this.openMode === OPERATION_TYPE.VIEW);
            trainingItems.push(itemControl);
          });
        } else {
          trainingItems.invisible = true;
        }
      }
    }
    this.logger.info(``, { class: 'ActivityComponent', method: 'onChangeVisitDate', classification: LOG_CLSF.METHOD_END });
    this.activityForm.getActivityFormControl('visitDate').markAsDirty(); // test
  }

  /**
   * Clear all value in Activity Form
   */
  clearForm() {
    this.logger.info(``, { class: 'ActivityComponent', method: 'clearForm', classification: LOG_CLSF.METHOD_START });
    if (this.activityInput === ACTIVITY_INPUT.PLAN) {
      this.activityForm.getActivityFormControl('visitDate').clear();
      // this.activityForm.getActivityFormControl('visitTime.startTime').clear();
      // this.activityForm.getActivityFormControl('visitTime.endTime').clear();
      this.activityForm.getActivityFormControl('visitTime.startTimeHours').clear();
      this.activityForm.getActivityFormControl('visitTime.endTimeHours').clear();
      this.activityForm.getActivityFormControl('visitTime.startTimeMin').clear();
      this.activityForm.getActivityFormControl('visitTime.endTimeMin').clear();
    } else {
      this.activityForm.getActivityFormControl('visitingName.visiting').clear('');
      this.activityForm.getActivityFormControl('visitingName.customerName').clear();
      this.activityForm.getActivityFormControl('visitingName.visitDestinationName').clear();
      this.activityForm.getActivityFormControl('interviewee.interviewee1').clear('');
      this.activityForm.getActivityFormControl('interviewee.interviewee2').optionList = [];
      this.activityForm.getActivityFormControl('interviewee.interviewee2').clear('');
      this.activityForm.getActivityFormControl('interviewee.interviewee2txt').invisible = true;
      this.activityForm.getActivityFormControl('interviewee.interviewee2txt').setValue('');
      this.activityForm.getActivityFormControl('interviewee.interviewername').clear();
      this.activityForm.getActivityFormControl('companion').clear('');
      this.activityForm.getActivityFormControl('outlineExplanation').clear(1);
      this.activityForm.getActivityFormControl('concreteContent').clear();
    }
    this.activityForm.getActivityFormControl('purpose').clear('');
    this.activities.controls = this.activities.controls.slice(0, 1);
    (this.activities.controls[0] as ActivityFormControl).clear('');
    this.clearTrainingForm();
    this.logger.info(``, { class: 'ActivityComponent', method: 'clearForm', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Clear all value in Training Form
   */
  clearTrainingForm() {
    this.logger.info(``, { class: 'ActivityComponent', method: 'clearTrainingForm', classification: LOG_CLSF.METHOD_START });
    this.activityForm.getActivityFormControl('training.numberOfParticipants').clear(0);
    if (this.trainingContents.controls.length > 0) {
      this.trainingContents.controls = this.trainingContents.controls.slice(0, 1);
      this.activityForm.getActivityFormControl('training.trainingContentArray.0.trainingContent').clear('');
      this.activityForm.getActivityFormControl('training.trainingContentArray.0.remarks').clear();
      this.activityForm.getFormControlArray('training.trainingItems').controls.forEach(item => {
        item.setValue(false);
      });
    }
    this.logger.info(``, { class: 'ActivityComponent', method: 'clearTrainingForm', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Get pack matching data from resource file
   */
  packMatching(visitDateChange?) {
    this.logger.info(``, { class: 'ActivityComponent', method: 'packMatching', classification: LOG_CLSF.METHOD_START });
    const interviewee1 = this.activityForm.getActivityFormControl('interviewee.interviewee1');
    let inputDate = null;
    if (this.activityForm.getActivityFormControl('visitDate').value) {
      inputDate = new Date(this.activityForm.getActivityFormControl('visitDate').value);
    }
    if (this.activityInput === ACTIVITY_INPUT.INPUT) {
      // Get pack matching data for 面談者区分リスト
      this.logger.trace(`Get pack matching data for 面談者区分リスト`, { class: 'ActivityComponent', method: 'packMatching' });
      if (inputDate) {
        SharedData.getInstance().putCommonData(SECTION.G612, COMMON.PackMatch, {
          SSKKBN: SharedData.getInstance().getCommonData(SECTION.GLOBAL, COMMON.SSKKBN),
          G612IG6121: this.visitCat.value as string,
          IG6101: inputDate
        });
        interviewee1.optionList = BuisinessUtility.packMatching('PG6面談者区分', SECTION.G612, COMMON.PackMatch);
      } else {
        interviewee1.optionList = [];
      }

      let ig6182 = '';
      let g612ig6182 = '';
      let g612ig61351 = '';
      let ig6135 = '';
      if (this.openMode !== OPERATION_TYPE.ADD) {
        const inputData = SharedData.getInstance().getCommonData(SECTION.G612, COMMON.G612_INPUTDATA);
        if (inputData) {
          ig6182 = inputData[0][55];
          g612ig6182 = inputData[0][55];
          g612ig61351 = inputData[0][16];
          ig6135 = inputData[0][16];
        }
      }
      // Get pack matching data for 同行者区分リスト
      this.logger.trace(`Get pack matching data for 同行者区分リスト`, { class: 'ActivityComponent', method: 'packMatching' });
      const companion = this.activityForm.getActivityFormControl('companion');
      if (inputDate) {
        SharedData.getInstance().putCommonData(SECTION.G612, COMMON.PackMatch, {
          SSKKBN: SharedData.getInstance().getCommonData(SECTION.GLOBAL, COMMON.SSKKBN),
          G612IG6121: this.visitCat.value as string,
          IG6101: inputDate,
          IG6182: ig6182,
          G612IG6182: g612ig6182,
          G612IG61351: g612ig61351,
        });
        companion.optionList = BuisinessUtility.packMatching('PG6同行区分', SECTION.G612, COMMON.PackMatch);
      } else {
        companion.optionList = [];
      }

      // Get pack matching data for 活動内容
      this.logger.trace(`Get pack matching data for 活動内容`, { class: 'ActivityComponent', method: 'packMatching' });
      if (inputDate) {
        SharedData.getInstance().putCommonData(SECTION.G612, COMMON.PackMatch, {
          SSKKBN: SharedData.getInstance().getCommonData(SECTION.GLOBAL, COMMON.SSKKBN),
          G612IG6121: this.visitCat.value as string,
          IG6101: inputDate,
          IG6135: ig6135
        });
        this.activities.optionList =
          BuisinessUtility.packMatching('PG6活動内容', SECTION.G612, COMMON.PackMatch);
      } else {
        this.activities.optionList = [];
      }
    } else {
      // Get pack matching data for 次回活動内容
      this.logger.trace(`Get pack matching data for 次回活動内容`, { class: 'ActivityComponent', method: 'packMatching' });
      if (inputDate) {
        SharedData.getInstance().putCommonData(SECTION.G612, COMMON.PackMatch, {
          SSKKBN: SharedData.getInstance().getCommonData(SECTION.GLOBAL, COMMON.SSKKBN),
          G612IG6121: this.visitCat.value as string,
          IG6101: inputDate
        });
        this.activities.optionList =
          BuisinessUtility.packMatching('PG6活動予定', SECTION.G612, COMMON.PackMatch);
      } else {
        this.activities.optionList = [];
      }
    }
    // Get pack matching data for 訪問目的
    this.logger.trace(`Get pack matching data for 訪問目的`, { class: 'ActivityComponent', method: 'packMatching' });
    SharedData.getInstance().putCommonData(SECTION.G612, COMMON.PackMatch, null);
    this.activityForm.getActivityFormControl('purpose').optionList =
      BuisinessUtility.packMatching('PG6訪問目的', SECTION.G612, COMMON.PackMatch);

    // Get pack matching data for 研修内容
    this.logger.trace(`Get pack matching data for 研修内容`, { class: 'ActivityComponent', method: 'packMatching' });
    SharedData.getInstance().putCommonData(SECTION.G612, COMMON.PackMatch, null);
    this.trainingContents.optionList =
      BuisinessUtility.packMatching('PG6研修項目', SECTION.G612, COMMON.PackMatch);
    if (visitDateChange) {
      if (interviewee1.optionList.length > 0 && interviewee1.value) {
        interviewee1.selectValueInList(ele => {
          return ele && ele.value === Object.values(interviewee1.value)[0];
        });
      }
      const companion = this.activityForm.getActivityFormControl('companion');
      if (companion.optionList.length > 0 && companion.value) {
        companion.selectValueInList(ele => {
          return ele && ele.value === Object.values(companion.value)[0];
        });
      }
      if (this.activities && this.activities.value[0]) {
        const activitySelected = this.activities.value.map(data => data.value );
        if (activitySelected) {
          this.activities.selectValueInList(0, ele => {
            return ele.value ===  activitySelected[0] ;
          });
        }
      }
      const ddlPurpose = this.activityForm.getActivityFormControl('purpose');
      if (ddlPurpose && ddlPurpose.value) {
        ddlPurpose.selectValueInList(ele => {
          return ele && ele.value === Object.values(ddlPurpose.value)[0];
        });
      }
      const ddlTrainingContent = (Object (this.trainingContents.controls[0]).controls.trainingContent) as ActivityFormControl;
      ddlTrainingContent['optionList'] = this.trainingContents.optionList;
      if (ddlTrainingContent && ddlTrainingContent['optionList'].length > 0 && ddlTrainingContent.value) {
        ddlTrainingContent.selectValueInList(ele => {
          return ele  && ele.value === Object.values(ddlTrainingContent.value)[0];
        });
      }
    } else {
      this.clearForm();
      switch (this.visitCat.value) {
        case this.CUSTOMER_AGENCY:
          if (this.activityInput === ACTIVITY_INPUT.INPUT && interviewee1.optionList.length > 0) {
            interviewee1.setValue(interviewee1.optionList[0]);
          }
          break;
        case this.CUSTOMER_NOT_AGENCY:
          this.activities.selectValueInList(0, ele => {
            return ele && ele.value === '90';
          });
          break;
        case this.OTHER:
          if (this.activityInput === ACTIVITY_INPUT.INPUT) {
            interviewee1.selectValueInList(ele => {
              return ele && ele.value === '90';
            });
          }
          break;
      }
    }
    this.logger.info(``, { class: 'ActivityComponent', method: 'packMatching', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Getting agent list for 訪問先リスト
   */
  getAgentList() {
    this.logger.info(``, { class: 'ActivityComponent', method: 'getAgentList', classification: LOG_CLSF.METHOD_START });
    const skbnCode = SharedData.getInstance().getCommonData(SECTION.G612, COMMON.SKBN);
    if (skbnCode === INPUT_DATE.SAME_DAY && this.activityInput === ACTIVITY_INPUT.INPUT) {
      this.loading.startLoading();
      SharedData.getInstance().putSendBody(SECTION.G612, TRANCODE.T2G612S2, {
        IE5001: SharedData.getInstance().getCommonData(SECTION.G610, COMMON.IE50012)
      });
      this.logger.info(`SECTION=${SECTION.G612}, TRANCODE=${TRANCODE.T2G612S2}`,
        { class: 'ActivityComponent', method: 'getAgentList', classification: LOG_CLSF.START });
      this.webComunication.sendRecv(SECTION.G612, COMMON_ONLINE_SERVICE_NAME, TRANCODE.T2G612S2).subscribe(result => {
        SharedDataUtil.getBodyMessage(result, SECTION.G612, TRANCODE.T2G612S2, () => {
          const body = SharedData.getInstance().getRecvBody(SECTION.G612, TRANCODE.T2G612S2);
          if (body != null && body.IK0011GD != null && body.IK0011GD.length > 0) {
            const visitingControl = this.activityForm.getActivityFormControl('visitingName.visiting');
            visitingControl.optionList = body.IK0011GD.map(ele => {
              return new Agent(ele[0], ele[1], ele[2], ele[3]);
            });
          }
          // After getting agent list successfully, control display and restore saved data
          this.controlItemsDisplay();
          this.checkDataToRestore();
          this.loading.stopLoading();
          this.logger.info(`Getting agent list successfully. SECTION=${SECTION.G612}, TRANCODE=${TRANCODE.T2G612S2}`,
            { class: 'ActivityComponent', method: 'getAgentList', classification: LOG_CLSF.END });
        }, () => {
          // Failed to get agent list from server.
          this.controlItemsDisplay();
          this.checkDataToRestore();
          this.loading.stopLoading();
          this.logger.info(`Failed to get agent list from server. SECTION=${SECTION.G612}, TRANCODE=${TRANCODE.T2G612S2}`,
            { class: 'ActivityComponent', method: 'getAgentList', classification: LOG_CLSF.END });
        });
      });
    } else {
      // In case plan form, no need to get agent list before controlling display and restoring saved data
      this.controlItemsDisplay();
      this.checkDataToRestore();
    }
    this.logger.info(``, { class: 'ActivityComponent', method: 'getAgentList', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Getting Training Items by visit time
   * @param date visit time
   */
  getTrainingItems(date: Date): Array<TrainingOptionModel> {
    this.logger.info(``, { class: 'ActivityComponent', method: 'getTrainingItems', classification: LOG_CLSF.METHOD_START });
    let fiscalYear = date.getFullYear();
    if (date.getMonth() >= 0 && date.getMonth() < 3) {
      fiscalYear--;
    }
    this.oldFiscalYear = fiscalYear;
    let optionList = [];
    if (this.trainingReader.trainingModel.getItem(fiscalYear)) {
      optionList = this.trainingReader.trainingModel.getItem(fiscalYear).optionList;
    }
    this.logger.info(``, { class: 'ActivityComponent', method: 'getTrainingItems', classification: LOG_CLSF.METHOD_END });
    return optionList;
  }

  /**
   * Check if there are saved data. If it exists, restore and remove saved data
   */
  checkDataToRestore() {
    this.logger.info(``, { class: 'ActivityComponent', method: 'checkDataToRestore', classification: LOG_CLSF.METHOD_START });
    // const savedDataKey = this.activityInput === ACTIVITY_INPUT.INPUT ? COMMON.G612_INPUTDATA : COMMON.G612_PLANDATA;
    const inputData = SharedData.getInstance().getCommonData(SECTION.G612, COMMON.G612_INPUTDATA);
    if (inputData && inputData.length > 0) {
      this.restoreSavedData(inputData, this.activityForm, this.activityInput === ACTIVITY_INPUT.PLAN);
      SharedData.getInstance().putCommonData(SECTION.G612, COMMON.G612_INPUTDATA, null);
      if (this.openMode === OPERATION_TYPE.ADD) {
        document.getElementsByClassName('scrollContent')[0].scrollTop = 285;
      }
    }
    this.logger.info(``, { class: 'ActivityComponent', method: 'checkDataToRestore', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Restoring saved data to activity form
   * @param inputData saved data
   * @param inputForm activity form that is applied to
   * @param isPlan true if this is Plan form, otherwise, false
   */
  restoreSavedData(inputData: any, inputForm: ActivityFormGroup, isPlan: boolean) {
    this.logger.info(`inputData=${inputData}, isPlan=${isPlan}`,
      { class: 'ActivityComponent', method: 'restoreSavedData', classification: LOG_CLSF.METHOD_START });
    inputForm.get('visitDate').setValue(inputData[0][0] ? inputData[0][0].replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3') : '');
    if (inputData[0][8]) {
      inputForm.getActivityFormControl('visitTime.startTimeHours').setValue(`${inputData[0][8]}`);
    }
    if (inputData[0][9]) {
      inputForm.getActivityFormControl('visitTime.startTimeMin').setValue(`${inputData[0][9]}`);
    }
    if (inputData[0][10]) {
      inputForm.getActivityFormControl('visitTime.endTimeHours').setValue(`${inputData[0][10]}`);
    }
    if ( inputData[0][11]) {
      inputForm.getActivityFormControl('visitTime.endTimeMin').setValue(`${inputData[0][11]}`);
    }
    inputForm.getActivityFormControl('visitCategory').setValue(parseInt(inputData[0][2], 10));
    if (!isPlan) {
      const visiting = inputForm.getActivityFormControl('visitingName.visiting');
      if (this.openMode === OPERATION_TYPE.ADD) {
         visiting.selectValueInList(ele => {
           return ele.nameKanji === inputData[0][4] && ele.classification === inputData[0][7];
         });
      } else {
         visiting.optionList = [
           new Agent(inputData[0][4], inputData[0][7], inputData[0][1], undefined)
         ];
         visiting.setValue(visiting.optionList[0]);
      }
      this.onChangeVisiting(); // trigger change event of 訪問先リスト
      inputForm.getActivityFormControl('visitingName.customerName').setValue(inputData[0][3]);
      inputForm.getActivityFormControl('visitingName.customerName').valueObj = { IF0551: inputData[0][5] };
      if (this.openMode === OPERATION_TYPE.ADD) {
        inputForm.getActivityFormControl('visitingName.customerName').markAsDirty();
      }
      inputForm.getActivityFormControl('visitingName.visitDestinationName').setValue(inputData[0][6]);
      inputForm.getActivityFormControl('interviewee.interviewee1').selectValueInList(ele => {
        return inputData[0][12] === ele.value;
      });
      this.onChangeInterviewClsf(); // trigger change event of 面談者区分リスト
      if (parseInt(inputData[0][2], 10) === VISIT_TYPE.AGENCY) {
        if (inputData[0][14] === '9') {
          inputForm.getActivityFormControl('interviewee.interviewee2').setValue('その他(手入力)');
          this.activityForm.getActivityFormControl('interviewee.interviewee2txt').invisible = false;
          this.activityForm.getActivityFormControl('interviewee.interviewee2txt').setValue(inputData[0][13]);
          SharedData.getInstance().putCommonData(SECTION.G612, COMMON.MendanEdit, true);
        } else {
          inputForm.getActivityFormControl('interviewee.interviewee2').setValue(inputData[0][13]);
          inputForm.getActivityFormControl('interviewee.interviewee2').valueObj = {
            employeeDisplay: inputData[0][14],
            employeeCode: inputData[0][15]
          };
          SharedData.getInstance().putCommonData(SECTION.G612, COMMON.MendanEdit, false);
        }
      }
      if (parseInt(inputData[0][2], 10) === VISIT_TYPE.CUSTOMER_AGENCY ||
        parseInt(inputData[0][2], 10) === VISIT_TYPE.CUSTOMER_NOT_AGENCY) {
        inputForm.getActivityFormControl('interviewee.interviewername').setValue(inputData[0][13]);
      }
      inputForm.getActivityFormControl('companion').selectValueInList(ele => {
        return ele.value === inputData[0][55];
      });
      //inputForm.getActivityFormControl('outlineExplanation').setValue(parseInt(inputData[0][57], 10));
      switch (inputData[0][57]) {
        case '2': {
          this.formModelService.outlineOfContractYes = true;
          this.formModelService.outlineOfContractNo  = false;
          break;
        }
        case '1': {
          this.formModelService.outlineOfContractYes = false;
          this.formModelService.outlineOfContractNo  = true;
          break;
        }
      }
      inputForm.getActivityFormControl('concreteContent').setValue(inputData[0][53] + inputData[0][54]);
    }
    inputForm.getFormControlArray('activityArray').removeAll();
    inputData.forEach((data, index) => {
      inputForm.getFormControlArray('activityArray').push(
        new ActivityFormControl(false, false, null, null,
          `IG6135${inputForm.getFormControlArray('activityArray').controls.length}${this.activityInput}`, true)
      );
      inputForm.getFormControlArray('activityArray').selectValueInList(index, ele => {
        return ele.value === data[16];
      });
      this.controlTrainingContentDisplay(); // trigger change event of 活動内容
    });
    inputForm.getActivityFormControl('purpose').selectValueInList(ele => {
      return ele.value === inputData[0][56];
    });
    if (inputData.find(data => data[16] === '2') != null) {
      // if 活動内容 selects 事務所・代理店研修, restore training content group
      inputForm.getActivityFormControl('training.numberOfParticipants').setValue(inputData[0][21]);
      inputForm.getFormControlArray('training.trainingContentArray').removeAll();
      const trainingData = inputData[0].slice(17, 42);
      let showTrainingItems = false;
      for (let i = 0; i < trainingData.length; i += 5) {
        if (trainingData[i] || trainingData[i + 1]) {
          const selectedContent = this.trainingContents.optionList.find(content => {
            return trainingData[i] === content.value;
          });
          // if 研修内容 selects コンプラ研修, restore training items group
          if (selectedContent && selectedContent.value === '3' && selectedContent.description === 'コンプラ研修') {
            showTrainingItems = true;
          }
          inputForm.getFormControlArray('training.trainingContentArray').push(
            new FormControlGroup(false, {
              trainingContent: new ActivityFormControl(false, false, selectedContent, null,
                `IG6141${inputForm.getFormControlArray('training.trainingContentArray').controls.length + 1}${this.activityInput}`, true),
              remarks: new ActivityFormControl(false, false, trainingData[i + 1], Validators.compose([
                FullwidthValidator.fullwidth(), Validators.maxLength(15)
              ]), `IG6142${inputForm.getFormControlArray('training.trainingContentArray').controls.length + 1}${this.activityInput}`)
            })
          );
          this.controlTrainingItemsDisplay(); // trigger change event of 研修内容
        }
      }
      // Restore training items group
      if (showTrainingItems) {
        const trainingItemsData = inputData[0].slice(42, 52);
        const trainingItems = inputForm.getFormControlArray('training.trainingItems');
        trainingItems.removeAll();
        const visitDate = new Date(inputForm.getActivityFormControl('visitDate').value);
        // Getting training items list by visit date
        const items = this.getTrainingItems(visitDate);
        if (items && items.length > 0) {
          items.forEach((ele, index) => {
            const itemControl = new ActivityFormControl(false, false, false, null, `IG6N00${index + 1}${this.activityInput}`, true);
            itemControl.valueObj = { value: ele.id, label: ele.getDisplayName() };
            itemControl.disableControl(ele.id === '0' || this.openMode === OPERATION_TYPE.VIEW);
            itemControl.setValue(trainingItemsData[index] !== '' && trainingItemsData[index] !== '0');
            trainingItems.push(itemControl);
          });
        } else {
          trainingItems.invisible = true;
        }
      }
    }
    this.logger.info(``, { class: 'ActivityComponent', method: 'restoreSavedData', classification: LOG_CLSF.METHOD_END });
  }

  openTrainingItemsPopup() {
    this.logger.info(``, { class: 'ActivityComponent', method: 'openTrainingItemsPopup', classification: LOG_CLSF.METHOD_START });
    const matDialog = InjectorInstance.get(MatDialog);
    const trainingItems = this.activityForm.getFormControlArray('training.trainingItems');
    const itemLabels = new Array();
    const itemArgs = new Array();
    for (const item of trainingItems.controls) {
      const trainingItem = item as ActivityFormControl;
      itemLabels.push(trainingItem.valueObj.label);
      itemArgs.push([trainingItem.disabled, trainingItem.value]);
    }
    if (!trainingItems.isInvisible()) {
      const dialog = DialogComponent.openDialog(matDialog, {
        type: DialogType.TRAINING_ITEMS,
        messages: itemLabels,
        args: itemArgs,
        hasNoTitle: true
      });
      dialog.afterClosed().subscribe(selection => {
        if (selection) {
          let count = 0;
          for (const item of trainingItems.controls) {
            if (!selection[count][0]) {
              item.setValue(selection[count][1]);
              trainingItems.markAsDirty();
            }
            count++;
          }
        }
      });
    }
    this.logger.info(``, { class: 'ActivityComponent', method: 'openTrainingItemsPopup', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Subcribe handler to speech service
   */
  catchEvent() {
    this.logger.info(``, { class: 'ActivityComponent', method: 'catchEvent', classification: LOG_CLSF.METHOD_START });
    this.speechSubscription = this.speechService.getChangeEvent().subscribe(event => {
      if (event.returnValue === 0) {
        // Successfully, set value for 具体的内容
        if (event.mode === SpeechMode.SPECIFIC_CONTENT) {
          this.activityForm.getActivityFormControl('concreteContent').setValue(event.value);
          this.activityForm.getActivityFormControl('concreteContent').markAsDirty();
        }
      }

      // Trigger blur event to stop listening of speech service
      if (event.mode === SpeechMode.SPECIFIC_CONTENT && this.voiceBtn != null) {
        this.voiceBtn.nativeElement.blur();
      }
    });
    this.logger.info(``, { class: 'ActivityComponent', method: 'catchEvent', classification: LOG_CLSF.METHOD_END });
  }

  /**
   * Action set specific content
   */
  setSpecificContent() {
    this.speechService.execute(SpeechMode.SPECIFIC_CONTENT);
  }

  /**
   * Event lost focus
   */
  lostFocus() {
    this.speechService.stopListening();
  }
  clickToElementByForm(controlname: string) {
    this.activityForm.getActivityFormControl(controlname).click();
  }
  onChangeEditableSelectTime(typeSelect, isSelect, event?) {
    this.logger.info(``,
      { class: 'ActivityComponent', method: 'onChangeEditableSelectTime', classification: LOG_CLSF.METHOD_START });
    if (isSelect) {
      this.activityForm.getActivityFormControl(typeSelect).setValue(event.target.value);
      this.activityForm.getActivityFormControl(typeSelect).markAsDirty();
    } else {
      if (typeSelect === 'visitTime.startTimeMin' || typeSelect === 'visitTime.endTimeMin') {
        if ( event.target.value < 10 && event.target.value.length < 2) {
          this.activityForm.getActivityFormControl(typeSelect).setValue('0' + event.target.value);
         }
      }
      switch (typeSelect) {
        case 'visitTime.startTimeHours':
            this.startTimeHours.nativeElement.value = '';
            break;
        case 'visitTime.startTimeMin':
            this.startTimeMin.nativeElement.value = '';
            break;
        case 'visitTime.endTimeHours':
            this.endTimeHours.nativeElement.value = '';
            break;
        case 'visitTime.endTimeMin':
            this.endTimeMin.nativeElement.value = '';
            break;
      }
    }
    this.logger.info(``,
      { class: 'ActivityComponent', method: 'onChangeEditableSelectParticipantNo', classification: LOG_CLSF.METHOD_END });
  }
  // tslint:disable-next-line: use-life-cycle-interface
  ngAfterViewChecked() {
    const inputElement: HTMLElement =
    document.body.querySelector('.mat-form-field-wrapper .mat-form-field-flex .mat-form-field-infix input');
    inputElement.style.width = '100%';
    inputElement.style.padding = '8px 10px';
    inputElement.style.border = '2px solid rgba(40, 115, 144, 1)';
    inputElement.style.padding = '8px 10px';
    inputElement.style.borderRadius = '10px';
    inputElement.style.marginTop = '-20px';
    inputElement.style.height = '20px';
    const iconElement: HTMLElement = document.body.querySelector('div.mat-form-field-suffix');
    iconElement.style.marginTop = '8px';
    iconElement.style.position = 'absolute';
    iconElement.style.marginLeft = '83%';

    const matFormField: HTMLElement = document.body.querySelector('mat-form-field');
    matFormField.style.marginLeft = '-25px !important';
    matFormField.style.width = '108% !important';
    matFormField.style.height = '0px !important';
  }
  openedCalendarContent() {
    // const matDatepickerContent: HTMLElement = document.body.querySelector('.mat-datepicker-content');
    // matDatepickerContent.style.marginLeft = '1%';
  }
  onChangeConcretecontent(event) {
    this.countConcreteContent = event.length || 0;
  }
  reInitialValidation() {
    const initialData = SharedData.getInstance().getCommonData(SECTION.G612, COMMON.IG610TBL);
    let selectTraining = '';
    if (initialData) {
      selectTraining = initialData[6];
    }

    switch (this.visitCat.value) {
      case this.AGENCY : {
        if ((this.selectedTrainingContent || selectTraining) !== '2') {
          this.activityForm.getActivityFormControl('visitDate').setRequired(true);
          this.activityForm.getActivityFormControl('visitCategory').setRequired(true);
          this.activityForm.getFormControlGroup('visitTime').setRequired(true);
          this.activityForm.getActivityFormControl('visitTime.startTimeMin').setRequired(true);
          this.activityForm.getActivityFormControl('visitTime.startTimeHours').setRequired(true);
          this.activityForm.getActivityFormControl('visitTime.endTimeHours').setRequired(true);
          this.activityForm.getActivityFormControl('visitTime.endTimeMin').setRequired(true);
          this.activityForm.getFormControlGroup('visitingName').setRequired(true);
          this.activityForm.getActivityFormControl('visitingName.visiting').setRequired(true);
          this.activityForm.getActivityFormControl('visitingName.customerName').setRequired(true);
          this.activityForm.getActivityFormControl('visitingName.getCustomerNameBtn').setRequired(true);
          this.activityForm.getActivityFormControl('visitingName.visitDestinationName').setRequired(true);

          this.activityForm.getFormControlGroup('interviewee').setRequired(true);
          this.activityForm.getActivityFormControl('interviewee.interviewee1').setRequired(true);
          this.activityForm.getActivityFormControl('interviewee.interviewee2').setRequired(true);
          this.activityForm.getFormControlGroup('interviewee').setOptional(false);
          this.activityForm.getFormControlArray('activityArray').setRequired(true);
          this.activityForm.getFormControlArray('activityArray').setOptional(false);
        } else {
          this.activityForm.getActivityFormControl('visitDate').setRequired(true);
          this.activityForm.getActivityFormControl('visitCategory').setRequired(true);
          this.activityForm.getFormControlGroup('visitTime').setRequired(true);
          this.activityForm.getActivityFormControl('visitTime.startTimeMin').setRequired(true);
          this.activityForm.getActivityFormControl('visitTime.startTimeHours').setRequired(true);
          this.activityForm.getActivityFormControl('visitTime.endTimeHours').setRequired(true);
          this.activityForm.getActivityFormControl('visitTime.endTimeMin').setRequired(true);

          this.activityForm.getFormControlGroup('visitingName').setRequired(true);
          this.activityForm.getActivityFormControl('visitingName.visiting').setRequired(true);
          this.activityForm.getActivityFormControl('visitingName.customerName').setRequired(true);
          this.activityForm.getActivityFormControl('visitingName.getCustomerNameBtn').setRequired(true);
          this.activityForm.getActivityFormControl('visitingName.visitDestinationName').setRequired(true);

          this.activityForm.getFormControlGroup('interviewee').setRequired(true);
          this.activityForm.getActivityFormControl('interviewee.interviewee1').setRequired(true);
          this.activityForm.getActivityFormControl('interviewee.interviewee2').setRequired(true);
          this.activityForm.getFormControlArray('activityArray').setRequired(true);
          this.activityForm.getFormControlArray('activityArray').setOptional(false);
          this.activityForm.getActivityFormControl('training').setRequired(true);
        }
        break;
      }
      case this.CUSTOMER_AGENCY: {
        this.activityForm.getActivityFormControl('visitDate').setRequired(true);
        this.activityForm.getFormControlGroup('visitTime').setRequired(true);
        this.activityForm.getActivityFormControl('visitTime.startTimeMin').setRequired(true);
        this.activityForm.getActivityFormControl('visitTime.startTimeHours').setRequired(true);
        this.activityForm.getActivityFormControl('visitTime.endTimeHours').setRequired(true);
        this.activityForm.getActivityFormControl('visitTime.endTimeMin').setRequired(true);
        this.activityForm.getActivityFormControl('visitCategory').setRequired(true);
        this.activityForm.getFormControlGroup('visitingName').setRequired(true);
        this.activityForm.getActivityFormControl('visitingName.visiting').setRequired(true);
        this.activityForm.getActivityFormControl('visitingName.customerName').setRequired(true);
        this.activityForm.getActivityFormControl('visitingName.getCustomerNameBtn').setRequired(true);
        this.activityForm.getActivityFormControl('visitingName.visitDestinationName').setRequired(true);
        this.activityForm.getFormControlGroup('interviewee').setRequired(true);
        this.activityForm.getActivityFormControl('interviewee.interviewee1').setRequired(true);
        this.activityForm.getActivityFormControl('interviewee.interviewee2').setRequired(true);
        this.activityForm.getFormControlArray('activityArray').setRequired(true);
        this.activityForm.getFormControlArray('activityArray').setOptional(false);
        this.activityForm.getActivityFormControl('training').setRequired(true);
        break;
      }
      case this.CUSTOMER_NOT_AGENCY: {
        this.activityForm.getActivityFormControl('visitDate').setRequired(true);
        this.activityForm.getFormControlGroup('visitTime').setRequired(true);
        this.activityForm.getActivityFormControl('visitTime.startTimeMin').setRequired(true);
        this.activityForm.getActivityFormControl('visitTime.startTimeHours').setRequired(true);
        this.activityForm.getActivityFormControl('visitTime.endTimeHours').setRequired(true);
        this.activityForm.getActivityFormControl('visitTime.endTimeMin').setRequired(true);
        this.activityForm.getActivityFormControl('visitCategory').setRequired(true);

        this.activityForm.getFormControlGroup('visitingName').setRequired(true);
        this.activityForm.getActivityFormControl('visitingName.visiting').setRequired(true);
        this.activityForm.getActivityFormControl('visitingName.customerName').setRequired(true);
        this.activityForm.getActivityFormControl('visitingName.getCustomerNameBtn').setRequired(true);
        this.activityForm.getActivityFormControl('visitingName.visitDestinationName').setRequired(true);

        this.activityForm.getFormControlGroup('interviewee').setRequired(true);
        this.activityForm.getActivityFormControl('interviewee.interviewee1').setRequired(true);
        this.activityForm.getActivityFormControl('interviewee.interviewee2').setRequired(true);
        this.activityForm.getFormControlArray('activityArray').setRequired(false);
        this.activityForm.getFormControlArray('activityArray').setOptional(true);
        this.activityForm.getActivityFormControl('training').setRequired(true);
        break;
      }
      case this.OTHER: {
        this.activityForm.getActivityFormControl('visitDate').setRequired(true);
        this.activityForm.getFormControlGroup('visitTime').setRequired(true);
        this.activityForm.getActivityFormControl('visitTime.startTimeMin').setRequired(true);
        this.activityForm.getActivityFormControl('visitTime.startTimeHours').setRequired(true);
        this.activityForm.getActivityFormControl('visitTime.endTimeHours').setRequired(true);
        this.activityForm.getActivityFormControl('visitTime.endTimeMin').setRequired(true);
        this.activityForm.getActivityFormControl('visitCategory').setRequired(true);
        this.activityForm.getFormControlGroup('visitingName').setRequired(false);
        this.activityForm.getActivityFormControl('visitingName.visiting').setRequired(false);
        this.activityForm.getActivityFormControl('visitingName.customerName').setRequired(false);
        this.activityForm.getActivityFormControl('visitingName.getCustomerNameBtn').setRequired(false);
        this.activityForm.getActivityFormControl('visitingName.visitDestinationName').setRequired(false);
        this.activityForm.getFormControlGroup('interviewee').setRequired(false);
        this.activityForm.getActivityFormControl('interviewee.interviewee1').setRequired(false);
        this.activityForm.getActivityFormControl('interviewee.interviewee2').setRequired(false);
        this.activityForm.getFormControlGroup('interviewee').setOptional(true);
        this.activityForm.getFormControlArray('activityArray').setRequired(true);
        this.activityForm.getFormControlArray('activityArray').setOptional(false);
        break;
      }
    }
    // If there are any changes to the vailidate UI, refresh the form to not submitted stage to apply effect
     this.activityForm.addValidators();
  }

  clickTapExpandVisitCategory() {
    const select = document.getElementById('visitCategory2') as HTMLElement;
    if (select) {
      const event = new MouseEvent('mousedown');
      select.dispatchEvent(event);
    }
  }

  clickTapExpandVisiting() {
    const select = document.getElementById('IG612K0') as HTMLElement;
    if (select) {
      const event = new MouseEvent('mousedown');
      select.dispatchEvent(event);
    }
  }

  clickTapExpandActivity() {
    const select = document.getElementById('IG613500') as HTMLElement;
    if (select) {
      const event = new MouseEvent('mousedown');
      select.dispatchEvent(event);
    }
  }

  clickTapExpandCompanion() {
    const select = document.getElementById('IG61820') as HTMLElement;
    if (select) {
      const event = new MouseEvent('mousedown');
      select.dispatchEvent(event);
    }
  }

  clickTapExpandPurpose() {
    const select = document.getElementById('IG61840') as HTMLElement;
    if (select) {
      const event = new MouseEvent('mousedown');
      select.dispatchEvent(event);
    }
  }

  clickTapExpandParticipants() {
    const select = document.getElementById('numberOfParticipants') as HTMLElement;
    if (select) {
      const event = new MouseEvent('mousedown');
      select.dispatchEvent(event);
    }
  }

  clickTapExpandTrainingContent() {
    const select = document.getElementById('IG614110') as HTMLElement;
    if (select) {
      const event = new MouseEvent('mousedown');
      select.dispatchEvent(event);
    }
  }

  clickTapExpandRemarks() {
    const input = document.getElementById('IG614210') as HTMLElement;
    if (input) {
      input.focus();
    }
  }

  clickTapExpandConcreteContent() {
    const textarea = document.getElementById('IG615K10') as HTMLElement;
    if (textarea) {
      textarea.focus();
    }
  }

  clickOutlineOfContract(event) {
    if (event) {
      switch (event.target.innerText) {
        case 'あり': {
          this.formModelService.outlineOfContractYes = true;
          this.formModelService.outlineOfContractNo  = false;
          break;
        }
        case 'なし': {
          this.formModelService.outlineOfContractYes = false;
          this.formModelService.outlineOfContractNo  = true;
          break;
        }
      }
    }
  }
}





