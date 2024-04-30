function arp(nr) {
  // 0-(nr-1)-0-(nr-1)-
  let [idx, sign] = [-1, 1];
  
  return function() {
    idx += sign;
    if (idx == -1 || idx == nr) {
      sign *= -1;
      idx += 2 * sign;
    }
    return idx;
  };
}


function encodeRailFenceCipher(string, numberRails) {
  const itr = arp(numberRails);
  let rls = Array(numberRails).fill("");
  for (let i = 0; i < string.length; i++) {
    rls[itr()] += string[i];
  }
  return rls.join("");
}


function decodeRailFenceCipher(string, numberRails) {
  // we arp() twice
  const rls = Array(numberRails).fill(0);
  let itr = arp(numberRails);
  for (let i = 0; i < string.length; i++) {
    rls[itr()] += 1;
  }
  let to = 0;
  rls.forEach((v, i) => {
    const newwto = to + v;
    rls[i] = Array.from(string.slice(to, newwto));
    to = newwto;
  });

  itr = arp(numberRails);
  let out = "";
  for (let x = 0; x < string.length; x++) {
    out += rls[itr()].shift();
  }

  return out;
}

