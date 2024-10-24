#version 140

uniform sampler2D sampler;
uniform float opacity;

in vec2 texcoord0;
out vec4 fragColor;

void main()
{
    fragColor = texture(sampler, texcoord0) * opacity;
}
