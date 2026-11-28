shader_type spatial;
// dere suyu (web irmakMat): koyu turkuaz, akış yönünde kayan dalgacıklar ve güneşte parlayan ince beyaz çizgiler
varying vec3 wp;
varying vec2 akis;
void vertex() { wp = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz; akis = COLOR.rg * 2.0 - 1.0; }
void fragment() {
	float t = TIME; vec2 p = wp.xz - akis * t * 0.9;
	float w = sin(p.x * 5.0 + p.y * 3.0) * 0.5 + sin(p.x * -2.0 + p.y * 7.0) * 0.5;
	vec3 c = vec3(0.24, 0.48, 0.52) * (0.92 + 0.12 * w);
	c = mix(c, vec3(0.85, 0.92, 0.92), smoothstep(0.85, 1.0, w) * 0.35);
	// parlak dalga sırtları (web'de güneş yansıması ince beyaz çizgiler)
	// uzun, ince, eğik çizgiler: tek yönde sık dalga × seyrek maske
	float hat = sin(dot(p, vec2(1.9, 0.8)) * 9.0 + sin(p.y * 2.3 + p.x * 0.7) * 1.6);
	float maske = smoothstep(-0.1, 0.6, sin(p.x * 1.3 - p.y * 2.1 + 1.7) * sin(p.x * 0.7 + p.y * 1.1));
	float cizgi = smoothstep(0.86, 0.97, hat) * maske;
	ALBEDO = mix(c, vec3(0.95, 0.98, 1.0), cizgi * 0.9);
	ROUGHNESS = 0.12; SPECULAR = 0.45;
	float dx = cos(p.x * 4.1 + p.y * 1.3) * 0.06 + cos(p.x * 9.0 - p.y * 3.0 + t * 2.0) * 0.03;
	float dz = cos(p.y * 4.7 - p.x * 1.1) * 0.06 + cos(p.y * 8.3 + p.x * 2.0 - t * 1.7) * 0.03;
	NORMAL = normalize((VIEW_MATRIX * vec4(normalize(vec3(-dx, 1.0, -dz)), 0.0)).xyz);
}
