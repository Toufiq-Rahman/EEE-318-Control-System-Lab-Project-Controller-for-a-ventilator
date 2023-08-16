clc;
clear all;
close all;
 
%% Defining of the Parameter of the lung ang hose
R_lung=5/1000;
C_lung =20;
R_leak =60/1000;
R_hose = 4.5/1000;
wn= 2*pi*30;
z=1; % zeta
s=tf('s');
 
%% Transfer function of the patient hose calculation
Ah= (-(R_hose^-1+R_leak^-1))/((R_lung*C_lung)*(R_lung^-1+R_hose^-1+R_leak^-1))
Bh=(R_hose^-1)/((R_lung*C_lung)*(R_lung^-1+R_hose^-1+R_leak^-1))
Ch1=(R_lung^-1)/((R_lung^-1+R_hose^-1+R_leak^-1))
Ch2= (-(R_hose^-1+R_leak^-1))/((R_lung)*(R_lung^-1+R_hose^-1+R_leak^-1))
Ch=[Ch1 Ch2]'
Dh1= (R_hose^-1)/((R_lung^-1+R_hose^-1+R_leak^-1))
Dh2= ((R_hose^-1))/((R_lung)*(R_lung^-1+R_hose^-1+R_leak^-1))
Dh= [Dh1 Dh2]'
 
H=ss(Ah,Bh,Ch,Dh);
H=tf(H)
 
 
%% Transfer function of the blower calculation
Ab= [-2*z*wn (-wn^2); 1 0]
Bb=[1;0]
Cb=[0 wn^2]
 
B=ss(Ab,Bb,Cb,0);
B=tf(B)
 
