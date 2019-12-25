// import { Component } from '@angular/core';
// import {
//   HttpClient,
//   HttpHeaders,
//   HttpParams,
//   HttpEventType
// } from '@angular/common/http';

// import { FileUploader } from 'ng2-file-upload';

import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {FileUploader} from "ng2-file-upload";
import {Observable} from "rxjs";
import {HttpClient} from "@angular/common/http";


// const URL = '/api/';
// const URL = 'http://localhost:8080/upload';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  // uploader:FileUploader;
  // hasBaseDropZoneOver:boolean;
  // hasAnotherDropZoneOver:boolean;
  // response:string;
 
  // constructor (){
  //   this.uploader = new FileUploader({
  //     url: URL,
  //     disableMultipart: true, // 'DisableMultipart' must be 'true' for formatDataFunction to be called.
  //     formatDataFunctionIsAsync: true,
  //     formatDataFunction: async (item) => {
  //       return new Promise( (resolve, reject) => {
  //         resolve({
  //           name: item._file.name,
  //           length: item._file.size,
  //           contentType: item._file.type,
  //           date: new Date()
  //         });
  //       });
  //     }
  //   });
  //   this.hasBaseDropZoneOver = false;
  //   this.hasAnotherDropZoneOver = false;
 
  //   this.response = '';
 
  //   this.uploader.response.subscribe( res => this.response = res );
  // }
 
  // public fileOverBase(e:any):void {
  //   this.hasBaseDropZoneOver = e;
  // }
 
  // public fileOverAnother(e:any):void {
  //   this.hasAnotherDropZoneOver = e;
  // }

  uploadForm: FormGroup;

  public uploader:FileUploader = new FileUploader({
    isHTML5: true
  });
  title: string = 'Angular File Upload';
  constructor(private fb: FormBuilder, private http: HttpClient ) { }

  uploadSubmit(){
        for (let i = 0; i < this.uploader.queue.length; i++) {
          let fileItem = this.uploader.queue[i]._file;
          if(fileItem.size > 10000000){
            alert("Each File should be less than 10 MB of size.");
            return;
          }
        }
        const listfile = [];
        const listType = [];
        let data = new FormData();
        for (let j = 0; j < this.uploader.queue.length; j++) {
          
          let fileItem = this.uploader.queue[j]._file;
          listfile.push(fileItem);
         
          data.append('file', fileItem);
          // data.append('fileSeq', 'seq'+j);
          // data.append( 'dataType', this.uploadForm.controls.type.value);
          
        }
        data.append("name", "abc");
        this.uploadFile(data).subscribe(data => alert(data.message));
        
        this.uploader.clearQueue();
  }

  uploadFile(data: FormData): Observable<any> {
    return this.http.post('http://localhost:8080/upload',  data);
  }

  ngOnInit() {
    this.uploadForm = this.fb.group({
      document: [null, null],
      type:  [null, Validators.compose([Validators.required])]
    });
  }
}
