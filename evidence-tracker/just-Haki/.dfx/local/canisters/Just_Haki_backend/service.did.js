export const idlFactory = ({ IDL }) => {
  const User = IDL.Record({ 'id' : IDL.Nat32, 'role' : IDL.Text });
  const Evidence = IDL.Record({
    'id' : IDL.Nat32,
    'accessLog' : IDL.Vec(User),
    'filename' : IDL.Text,
    'uploader' : IDL.Text,
  });
  return IDL.Service({
    'getEvidence' : IDL.Func([IDL.Nat32], [IDL.Opt(Evidence)], []),
    'loginUser' : IDL.Func([IDL.Nat32], [IDL.Opt(User)], []),
    'registerUser' : IDL.Func([User], [IDL.Bool], []),
    'uploadEvidence' : IDL.Func([Evidence, IDL.Nat32], [IDL.Bool], []),
  });
};
export const init = ({ IDL }) => { return []; };
