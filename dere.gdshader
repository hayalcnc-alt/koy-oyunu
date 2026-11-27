shader_type spatial;
// dere suyu: yeşil-mavi, akan ince dalgacıklar
varying vec3 wp;
void vertex() { wp = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz; }
void fragment() {
	float t = TIME; vec2 p = wp.xz;
	float n = sin(p.x * 3.1 + t * 1.3 + sin(p.y * 2.2 + t * 0.7) * 1.3) * sin(p.y * 2.7 - t * 1.1 + sin(p.x * 1.7) * 1.1);
	vec3 c = mix(vec3(0.20, 0.42, 0.44), vec3(0.30, 0.56, 0.58), 0.5 + 0.5 * n);
	c = mix(c, vec3(0.85, 0.92, 0.92), smoothstep(0.82, 1.0, n) * 0.35);
	ALBEDO = c; ROUGHNESS = 0.06;
	float dx = cos(p.x * 2.6 + t * 1.6) * 0.05 + cos((p.x + p.y) * 5.3 - t * 2.2) * 0.03;
	float dz = cos(p.y * 2.9 + t * 1.3) * 0.05 + cos((p.y - p.x) * 6.1 + t * 1.8) * 0.03;
	NORMAL = normalize((VIEW_MATRIX * vec4(normalize(vec3(-dx, 1.0, -dz)), 0.0)).xyz);
}
