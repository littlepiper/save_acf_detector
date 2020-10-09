function saveAcfDetector(path, detector)
% Usage example: saveAcfDetector('acfDetector.bin',detector)


fid = fopen(path, 'wb');

fwrite(fid, detector.opts.pPyramid.pChns.shrink', 'int32');
fwrite(fid, detector.opts.pPyramid.pChns.pColor.smooth', 'float32');

fwrite(fid, detector.opts.pPyramid.pChns.pGradMag.colorChn, 'int32');
fwrite(fid, detector.opts.pPyramid.pChns.pGradMag.normRad, 'float32');
fwrite(fid, detector.opts.pPyramid.pChns.pGradMag.normConst, 'float32');
fwrite(fid, detector.opts.pPyramid.pChns.pGradMag.full, 'uint8');

fwrite(fid, detector.opts.pPyramid.pChns.pGradHist.nOrients, 'int32');
fwrite(fid, detector.opts.pPyramid.pChns.pGradHist.softBin, 'uint8');
fwrite(fid, detector.opts.pPyramid.pChns.pGradHist.useHog, 'uint8');
fwrite(fid, detector.opts.pPyramid.pChns.pGradHist.clipHog, 'float32');

fwrite(fid, detector.opts.pPyramid.nPerOct, 'int32');
fwrite(fid, detector.opts.pPyramid.nOctUp, 'int32');
fwrite(fid, detector.opts.pPyramid.nApprox, 'int32');

fwrite(fid, length(detector.opts.pPyramid.lambdas), 'uint32');

fwrite(fid, detector.opts.pPyramid.lambdas(1), 'float32');
fwrite(fid, detector.opts.pPyramid.lambdas(2), 'float32');
fwrite(fid, detector.opts.pPyramid.lambdas(3), 'float32');

fwrite(fid, detector.opts.pPyramid.pad, 'int32');
fwrite(fid, detector.opts.pPyramid.minDs, 'float32');
fwrite(fid, detector.opts.pPyramid.smooth, 'float32');
fwrite(fid, detector.opts.pPyramid.complete, 'uint8');

[rows,cols,channels]=size(detector.opts.filters);
fwrite(fid, rows, 'uint32');
fwrite(fid, cols, 'uint32');
fwrite(fid, channels, 'uint32');
fwrite(fid, detector.opts.filters, 'float32');

fwrite(fid, detector.opts.modelDs, 'float32');
fwrite(fid, detector.opts.modelDsPad, 'float32');

fwrite(fid, detector.opts.stride, 'uint32');
fwrite(fid, detector.opts.cascThr, 'float32');
fwrite(fid, detector.opts.cascCal, 'float32');

[nodes,~] = size(detector.clf.fids);
fwrite(fid, nodes, 'uint32');
fwrite(fid, detector.opts.pBoost.nWeak, 'uint32');
fwrite(fid, detector.clf.treeDepth, 'uint32');
fwrite(fid, detector.clf.fids, 'uint32');
fwrite(fid, detector.clf.thrs, 'float32');
fwrite(fid, detector.clf.child, 'uint32');
fwrite(fid, detector.clf.hs, 'float32');

fclose(fid);
end
