function D = distanciasDiscretas( A, B, distancias )
    
    pA= A(:)';
	pB= B(:)';
    otus = Otus(pA,pB);
    for i = 1 : length(distancias)
        dis = distancias{i};
        fhandle = str2func(dis);
        resultado = fhandle(otus);
        D(i) = resultado;
    end
end


function r =  jaccard(otus)
    r =  otus.a / (otus.a + otus.b + otus.c);
end

function r =  dice(otus)
    r =  (2 * otus.a) / (2 * otus.a + otus.b + otus.c);
end

function r =  sczekanowki(otus)
    r =  (2 * otus.a) / (2 * otus.a + otus.b + otus.c);
end

function r =  jaccard3w(otus)
    r =  (3 * otus.a) / (3 * otus.a + otus.b + otus.c);
end

function r =  neiANDli(otus)
    r =  (2 * otus.a) / ((otus.a + otus.b) + (otus.a + otus.c));
end

function r =  sokalANDsneathI(otus)
    r =  otus.a / (otus.a + (2 * otus.b) + (2 * otus.c));
end

function r =  sokalANDmichener(otus)
    r =  otus.a + otus.b / (otus.a + otus.b + otus.c + otus.d);
end

function r =  sokalANDsneathII(otus)
    r =  (2 * (otus.a + otus.d)) / ((2 * otus.a) + otus.b + otus.c + (2 * otus.d));
end

function r =  rogerANDtanimoto(otus)
    r =  (otus.a + otus.d) / (otus.a + (2 * (otus.b + otus.c)) + otus.d);
end

function r =  faith(otus)
    r =  (otus.a + (0.5 * otus.d)) / (otus.a + otus.b + otus.c + otus.d);
end

function r =  gowerANDlegendre(otus)
    r =  (otus.a + otus.d) / (otus.a + (0.5 * (otus.b + otus.c)) + otus.d);
end

function r =  intersection(otus)
    r =  otus.a;
end

function r =  innerproduct(otus)
    r =  otus.a + otus.d;
end

function r =  russellANDrao(otus)
    r =  otus.a / (otus.a + otus.b + otus.c + otus.d);
end

function r =  hamming(otus)
    r =  otus.b + otus.c;
end

function r =  euclid(otus)
    r =  sqrt(otus.b + otus.c);
end

function r =  squaredEuclid(otus)
    r =  sqrt((otus.b + otus.c)^2);
end

%%%%%%%%
function r =  canberra(otus)
    r =  (otus.b + otus.c)^1;
end

function r =  manhattan(otus)
    r =  otus.b + otus.c;
end

function r =  meanManhattan(otus)
    r =  (otus.b + otus.c) / (otus.n);
end

function r =  cityblock(otus)
    r =  otus.b + otus.c;
end

%%%%%%%%%%
function r =  minkowki(otus)
    r =  (otus.b + otus.c)^1;
end

function r =  vari(otus)
    r =  (otus.b + otus.c) / (4 * otus.n);
end

function r =  sizedifference(otus)
    r =  (otus.b + otus.c)^2 / ((otus.n)^2);
end

function r =  shapedifference(otus)
    r =  (otus.n * (otus.b + otus.c) - (otus.b - otus.c)^2) / ((otus.n)^2);
end

function r =  patterndifference(otus)
    r =  (4 * otus.b * otus.c) / ((otus.n)^2);
end

function r =  lanceANDwilliams(otus)
    r =  (otus.b + otus.c) / (2 * otus.a + otus.b + otus.c);
end

function r =  brayANDcurtis(otus)
    r =  (otus.b + otus.c) / (2 * otus.a + otus.b + otus.c);
end

function r =  hellinger(otus)
    r =  2 * sqrt(1 - (otus.a / (sqrt((otus.a + otus.b) * (otus.a + otus.c)))));
end

function r =  chord(otus)
    r =  sqrt(2 * (1 - (otus.a / (sqrt((otus.a + otus.b) * (otus.a + otus.c))))));
end

function r =  cosine(otus)
    r =  otus.a / (sqrt(((otus.a + otus.b) * (otus.a + otus.c))^2));
end

function r =  gilbertANDwells(otus)
    r =  log(otus.a) - log(otus.n) - log((otus.a + otus.b) / (otus.n)) - log((otus.a + otus.c) / (otus.n));
end

function r =  ochaiaiI(otus)
    r =  otus.a / (sqrt((otus.a + otus.b) * (otus.a + otus.c)));
end

function r =  forbesi(otus)
    r =  (otus.n * otus.a) / ((otus.a + otus.b) * (otus.a + otus.c));
end

function r =  fossum(otus)
    r =  (otus.n * (otus.a - 0.5)^2) / ((otus.a + otus.b) * (otus.a + otus.c));
end

function r =  sorgenfrei(otus)
    r =  (otus.a)^2 / ((otus.a + otus.b) * (otus.a + otus.c));
end

function r =  mountford(otus)
    r =  otus.a / (0.5 * (otus.a * otus.b + otus.a * otus.c) + (otus.b * otus.c));
end

function r =  otsuka(otus)
    r =  otus.a / (((otus.a + otus.b) * (otus.a + otus.c))^(0.5));
end

function r =  mcconnaughey(otus)
    r =  ((otus.a)^2 - otus.b * otus.c) / ((otus.a + otus.b) * (otus.a + otus.c));
end

function r =  tarwid(otus)
    num = otus.n * otus.a - (otus.a + otus.b) * (otus.a + otus.c);
    den = otus.n * otus.a + (otus.a + otus.b) * (otus.a + otus.c);
    r =  num / (den);
end

function r =  kulczynskiII(otus)
    num = (otus.a / (2)) * (2 * otus.a + otus.b + otus.c);
    den = (otus.a + otus.b) * (otus.a + otus.c);
    r =  num / (den);
end

function r =  driverANDkroeber(otus)
    uno = (otus.a / (2));
    dos = 1 / (otus.a + otus.b);
    tres = 1 / (otus.a + otus.c);
    r =  uno * (dos + tres);
end

function r =  johnson(otus)
    uno = otus.a / (otus.a + otus.b);
    dos = otus.a / (otus.a + otus.c);
    r =  uno + dos;
end

function r =  denis(otus)
    r =  (otus.ad() - otus.bc()) / (sqrt(otus.n * otus.amasb() * otus.amasc()));
end

function r =  simpson(otus)
    r =  otus.a / (min(otus.amasb(), otus.amasc()));
end

function r =  braunANDbanquet(otus)
    r =  otus.a / (max(otus.amasb(), otus.amasc()));
end

function r =  fagerANDmcgowan(otus)
    uno = otus.a / (sqrt(otus.amasb() * otus.amasc()));
    dos = max(otus.amasb(), otus.amasc()) / (2);
    r =  uno - dos;
end

function r =  forbesII(otus)
    uno = otus.na() - otus.amasb() * otus.amasc();
    dos = otus.n * min(otus.amasb(), otus.amasc()) - otus.amasb() * otus.amasc();
    r =  uno / (dos);
end

function r =  sokalANDsneathIV(otus)
    uno = otus.a / (otus.amasb());
    dos = otus.a / (otus.amasc());
    tres = otus.d / (otus.bmasd());
    cuatro = otus.d / (otus.cmasd());
    r =  (uno + dos + tres + cuatro) / (4);
end
%%%%%%%% 50

function r =  gower(otus)
    den = sqrt(otus.amasb() * otus.amasc() * otus.bmasd() * otus.cmasd());
    r =  otus.amasb() / (den);
end

function r =  pearsonI(otus)
    uno = otus.n * (otus.ad() - otus.bc())^2;
    dos = otus.amasb() * otus.amasc() * otus.cmasd() * otus.bmasd();
    r =  uno / (dos);
end

function r =  pearsonII(otus)
    xcuadratic = pearsonI(otus);
    r =  sqrt(xcuadratic / (otus.n + xcuadratic));
end

function r =  pearsonIII(otus)
    p = pearsonANDHeronI(otus);
    r =  sqrt(p / (otus.n + p));
end

function r =  pearsonANDHeronI(otus)
    den = sqrt(otus.amasb() * otus.amasc() * otus.bmasd() * otus.cmasd());
    r =  (otus.ad() - otus.bc()) / (den);
end

function r =  pearsonANDHeronII(otus)
    num = pi * sqrt(otus.bc());
    den = sqrt(otus.ad()) + sqrt(otus.bc());
    r =  cos(num / (den));
end

function r =  sokalANDsneathIII(otus)
    r =  (otus.a + otus.d) / (otus.b + otus.c);
end

function r =  sokalANDsneathV(otus)
    den = (otus.amasb() * otus.amasc() * otus.bmasd() * otus.cmasd())^0.5;
    r =  otus.ad() / (den);
end

function r =  cole(otus)
    num = sqrt(2) * (otus.ad() - otus.bc());
    uno = (otus.ad() - otus.bc())^2;
    dos = otus.amasb() * otus.amasc() * otus.bmasd() * otus.cmasd();
    den = sqrt(uno - dos);
    r =  num / (den);
end

function r =  stiles(otus)
    uno = abs(otus.ad() - otus.bc());
    dos = otus.n / (2);
    num = otus.n * (uno - dos)^2;
    den = otus.amasb() * otus.amasc() * otus.bmasd() * otus.cmasd();
    r =  log10(num / (den));
end

function r =  ochiaiII(otus)
    r =  otus.ad() / (sqrt(otus.amasb() * otus.amasc() * otus.bmasd() * otus.cmasd()));
end

function r =  yuleqS(otus)
    num = otus.ad() - otus.bc();
    den = otus.ad() + otus.bc();
    r =  num / (den);
end

function r =  yuleqD(otus)
    num = 2 * otus.bc();
    den = otus.ad() + otus.bc();
    r =  num / (den);
end

function r =  yuleW(otus)
    num = sqrt(otus.ad()) - sqrt(otus.bc());
    den = sqrt(otus.ad()) + sqrt(otus.bc());
    r =  num / (den);
end

function r =  kulczynskiI(otus)
    r =  otus.a / (otus.b + otus.c);
end

function r =  tanimoto(otus)
    den = otus.amasb() + otus.amasc() - otus.a;
    r =  otus.a / (den);
end

function r =  disperson(otus)
    r =  (otus.ad() - otus.bc()) / ((otus.n)^2);
end

function r =  hamann(otus)
    r =  (otus.amasd() - otus.bmasc()) / (otus.n);
end

function r =  michael(otus)
    num = 4 * (otus.ad() - otus.bc());
    den = (otus.amasd())^2 + (otus.bmasc())^2;
    r =  num / (den);
end

function r =  goodmanANDkruskal(otus)
    s = sigma(otus);
    sp = sigmaPrima(otus);
    r =  (s - sp) / ((2 * otus.n) - sp);
end

function r =  anderberg(otus)
    s = sigma(otus);
    sp = sigmaPrima(otus);
    r =  (s - sp) / (2 * otus.n);
end

function r =  baroniUrbaniANDbuserI(otus)
    num = sqrt(otus.ad()) + otus.a;
    den = sqrt(otus.ad()) + otus.a + otus.b + otus.c;
    r =  num / (den);
end

function r =  baroniUrbaniANDbuserII(otus)
    num = sqrt(otus.ad()) + otus.a - (otus.b + otus.c);
    den = sqrt(otus.ad()) + otus.a + otus.b + otus.c;
    r =  num / (den);
end

function r =  peirce(otus)
    num = otus.ad() + otus.bc();
    den = otus.ab() + (2 * otus.bc()) + otus.cd();
    r =  num / (den);
end

function r =  eyraud(otus)
    num = (otus.n)^2 * (otus.na() - otus.amasb() * otus.amasc());
    den = otus.amasb() * otus.amasc() * otus.bmasd() * otus.cmasd();
    r =  num / (den);
end

function r =  tarantula(otus)
    num = otus.a * otus.cmasd();
    den = otus.c * otus.amasd();
    r =  num / (den);
end

function r =  ample(otus)
    r =  abs(tarantula(otus));
end
%%%%%%%%%%%%

function r =  sigma(otus)
    r =  max(otus.a, otus.b) + max(otus.c, otus.d) + max(otus.a, otus.c) + max(otus.b, otus.d);
end

function r =  sigmaPrima(otus)
    r =  max(otus.amasc(), otus.bmasd()) + max(otus.amasd(), otus.cmasd());
end




