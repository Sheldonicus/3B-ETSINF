function cstar=linmach(w,x)
  res = x * w;
  [maxv,argmaxv]=max(res,[],2);
  cstar = argmaxv;
endfunction
