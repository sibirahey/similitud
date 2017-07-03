classdef  Otus
    
    properties
        a
        b
        c
        d
        n
    end
    
    methods
        function obj = Otus(v1,v2)
            obj.a = 0;
            obj.b = 0;
            obj.c = 0;
            obj.d = 0;
            obj.n = 0;
            if(length(v1) == length(v2))
                for i = 1 : length(v1)
                    if v1(i) == 1 && v2(i) == 1
                        obj.a = obj.a + 1;
                        continue
                    end
                    if v1(i) == 0 && v2(i) == 1
                        obj.b = obj.b + 1;
                        continue
                    end
                    if v1(i) == 1 && v2(i) == 0
                        obj.c = obj.c + 1;
                        continue
                    end
                    if v1(i) == 0 && v2(i) == 0
                        obj.d = obj.d + 1;
                        continue
                    end
                end
                obj.n = obj.a + obj.b + obj.c + obj.d;
            else
                error('Otus:DifTam','Vectores deben de ser del mismo tamaño.');
            end
        end
        
        function r = amasb(obj)
            r = obj.a + obj.b;
        end
        
        function r =  amasc(obj)
            r =  obj.a + obj.c;
        end
        
        function r =  bmasd(obj)
            r =  obj.b + obj.d;
        end
        
        function r =  cmasd(obj)
            r =  obj.c + obj.d;
        end
        
        function r =  amasd(obj)
            r =  obj.a + obj.d;
        end
        
        function r =  bmasc(obj)
            r =  obj.b + obj.c;
        end
        
        function r =  ab(obj)
            r =  obj.a * obj.b;
        end
        
        function r =  ad(obj)
            r =  obj.a * obj.d;
        end
        
        function r =  bc(obj)
            r =  obj.b * obj.c;
        end
        
        function r =  cd(obj)
            r =  obj.c * obj.d;
        end
        
        function r =  na(obj)
            r =  obj.n * obj.a;
        end
    end
end

