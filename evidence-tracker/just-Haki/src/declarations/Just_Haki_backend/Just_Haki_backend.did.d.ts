import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface Evidence {
  'id' : number,
  'accessLog' : Array<User>,
  'filename' : string,
  'uploader' : string,
}
export interface User { 'id' : number, 'role' : string }
export interface _SERVICE {
  'getEvidence' : ActorMethod<[number], [] | [Evidence]>,
  'loginUser' : ActorMethod<[number], [] | [User]>,
  'registerUser' : ActorMethod<[User], boolean>,
  'uploadEvidence' : ActorMethod<[Evidence, number], boolean>,
}
