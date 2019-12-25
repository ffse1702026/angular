import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {FileDropDirective, FileSelectDirective} from "ng2-file-upload";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {CustomMaterialModule} from "./material.module";
import {HttpClientModule} from "@angular/common/http";

@NgModule({
  declarations: [
    AppComponent,
    FileSelectDirective,
    FileDropDirective

  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    CustomMaterialModule,

  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
