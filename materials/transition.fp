uniform lowp sampler2D tex0;
varying mediump vec2 var_texcoord0;

uniform mediump vec4 color;

void main() {
	float k = color.r;

	float diamondFractionSize = 0.02;

	float xFraction = fract(var_texcoord0.x / diamondFractionSize);
	float yFraction = fract(var_texcoord0.y / diamondFractionSize);

	float koeff = 1;
	float xDistance = abs(xFraction - 0.5 * koeff);
	float yDistance = abs(yFraction - 0.5 * koeff);

	if (xDistance + yDistance + var_texcoord0.x + var_texcoord0.y > 4 * k * k) {
		gl_FragColor = texture2D(tex0, var_texcoord0);
		//gl_FragColor = vec4(0, 0, 0, 0.0);
	} else {
		gl_FragColor = vec4(0, 0, 0, 1.0);
	}
}