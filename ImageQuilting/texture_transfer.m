function [imout] = texture_transfer(texture, target, patchsize, overlap, tol)
tic

outsize = [size(target, 1) size(target, 2)];
xtrim = patchsize - (outsize(2) - ((patchsize-overlap)*floor((outsize(2)-patchsize)/(patchsize-overlap))+1+patchsize-overlap));
ytrim = patchsize - (outsize(1) - ((patchsize-overlap)*floor((outsize(1)-patchsize)/(patchsize-overlap))+1+patchsize-overlap));

outsize_ = [outsize(1)+ytrim outsize(2)+xtrim];

if(size(target,3) ==1)
    imout = zeros(outsize_);
else
    imout = zeros([outsize_(1:2) size(target,3)]);
end

wb = waitbar(0,'Progress');
i_size = outsize_(1)-patchsize+1;
j_size = outsize_(2)-patchsize+1;

for i=1:patchsize-overlap:outsize_(1)-patchsize+1,
    for j=1:patchsize-overlap:outsize_(2)-patchsize+1,
        waitbar((i*j_size + j)/(i_size * j_size));
        if(i == 1 && j == 1)
            pos = find_mindelta(texture, target, [1 1], patchsize, tol);

            imout(i:i+patchsize-1,j:j+patchsize-1,:) = texture(pos(1):pos(1)+patchsize-1,pos(2):pos(2)+patchsize-1,:);
        else
            if(i > outsize(1)-patchsize+1)
                i_new = outsize(1)-patchsize+1;
            else
                i_new = i;
            end
            if(j > outsize(2)-patchsize+1)
                j_new = outsize(2)-patchsize+1;
            else
                j_new = j;
            end
            currentpos = [i_new j_new];

            patchpos = find_mindelta(texture, target, currentpos, patchsize, tol);

            imout = cut(texture, patchsize, overlap, imout, patchpos, currentpos);
        end
    end
end
delete(wb);
imout = imout(1:outsize(1),1:outsize(2),:);

toc