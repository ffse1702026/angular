numpy
scipy
matplotlib
pandas
sklearn
uwsgi
flask
redis
celery
import flask
from flask import Flask, request, abort
from celery import Celery
from celery.result import AsyncResult

from scipy.cluster.hierarchy import linkage
import pandas as pd
from sklearn.manifold import TSNE

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


