#ifdef GL_ES
precision mediump float;
#endif

varying vec4 v_color;
varying vec2 v_texCoord0;

uniform sampler2D u_sampler2D;

void main() {
    float Pixels = 128;

    vec2 p = v_texCoord0;

    p -= mod(p, 1.0 / Pixels);

    gl_FragColor = texture2D(u_sampler2D, p) * v_color;
}
