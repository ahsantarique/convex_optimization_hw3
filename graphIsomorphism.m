l = ones(30);

cvx_begin quiet
    cvx_precision low
    variable p(30, 30);
    minimize (sum(sum_square(p*A - B*p)));
    
    subject to
        p*l == l;
        for i = 1:30;
            for j = 1:30;
            p(i,j) <= 1;
            p(i,j) >= 0;
            end
        end
cvx_end

pc = p

for i = 1:30;
    max = -100;
    maxidx = -1;
    for j = 1:30;
     if p(i,j) > max;
         max = p(i,j);
         maxidx = j;
     end
     p(i,j) = 0;
    end
     p(i, maxidx) = 1;

end

if (p*A == B*p);
    disp('Found the solution');
    disp(p);
end
fileID = fopen('problem8results1.txt','w+');
fprintf(fileID, [repmat(' %g ', 1, 30) '\n'], pc);
fclose(fileID);
fileID = fopen('problem8results2.txt','w+');
fprintf(fileID, [repmat(' %g ', 1, 30) '\n'], p);
fclose(fileID);