% plotting range
x = -2:1e-3:2;

% std deviation chosen for best plot
s = 0.5;

hold on

% plot areas corresponding to bit error
x1_err = -2:1e-3:0;
a1 = area(x1_err,y1(1:length(x1_err)),'facecolor',[0 0 1]);
x2_err = 0:1e-3:2;
a2 = area(x2_err,y2(end-length(x2_err)+1:end),'facecolor',[1 0 0]);

% first curve centered about x=1
y1 = 1/(s*sqrt(2*pi)).*exp(-1/2.*((x-1)/s).^2);

% second curve centered about x-2
y2 = 1/(s*sqrt(2*pi)).*exp(-1/2.*((x+1)/s).^2);

% plot results
plot(x,y1,'-b',x,y2,'-r')

% add dotted lines about -1 and 1
yL = get(gca,'YLim');
line([-1 -1],yL,'Color','black','LineStyle','--');
line([1 1],yL,'Color','black','LineStyle','--');
hold off

% legend for errors
legend([a1 a2], {'P(Error|0)','P(Error|1)'});
title("Plot Displaying pdf's of Received BPSK Symbols")



