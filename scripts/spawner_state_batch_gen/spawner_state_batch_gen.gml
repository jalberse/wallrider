for (i=0; i < WAVES_MAX; i++){
	r = irandom(3);
	if (r == 0) waves[i] = "LINE";
	if (r == 1) waves[i] = "BLOCK";
	if (r == 2) waves[i] = "INACTIVE";
	if (r == 3) waves[i] = "HARMONIC_BLOCK";
}