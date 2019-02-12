% Canny Test
canny(P)
figure
imagesc(P)
figure
edge(P,'Canny')
edge(P,'Prewitt')