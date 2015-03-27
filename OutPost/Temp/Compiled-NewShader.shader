// Compiled shader for PC, Mac & Linux Standalone, uncompressed size: 109.8KB

// Skipping shader variants that would not be included into build of current scene.

Shader "Custom/NewShader" {
Properties {
 _Color ("Color", Color) = (1,1,1,1)
 _MainTex ("Albedo (RGB)", 2D) = "white" { }
 _Glossiness ("Smoothness", Range(0,1)) = 0.5
 _Metallic ("Metallic", Range(0,1)) = 0
}
SubShader { 
 LOD 200
 Tags { "RenderType"="Opaque" }


 // Stats for Vertex shader:
 //      opengl : 150 avg math (150..151), 3 avg texture (3..4), 9 branch
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
  GpuProgramID 42290
Program "vp" {
SubProgram "opengl " {
// Stats: 150 math, 3 textures, 9 branches
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLSL
#ifdef VERTEX
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  vec4 v_2;
  v_2.x = _World2Object[0].x;
  v_2.y = _World2Object[1].x;
  v_2.z = _World2Object[2].x;
  v_2.w = _World2Object[3].x;
  vec4 v_3;
  v_3.x = _World2Object[0].y;
  v_3.y = _World2Object[1].y;
  v_3.z = _World2Object[2].y;
  v_3.w = _World2Object[3].y;
  vec4 v_4;
  v_4.x = _World2Object[0].z;
  v_4.y = _World2Object[1].z;
  v_4.z = _World2Object[2].z;
  v_4.w = _World2Object[3].z;
  vec3 tmpvar_5;
  tmpvar_5 = normalize(((
    (v_2.xyz * gl_Normal.x)
   + 
    (v_3.xyz * gl_Normal.y)
  ) + (v_4.xyz * gl_Normal.z)));
  vec3 x2_6;
  vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5.xyzz * tmpvar_5.yzzx);
  x2_6.x = dot (unity_SHBr, tmpvar_7);
  x2_6.y = dot (unity_SHBg, tmpvar_7);
  x2_6.z = dot (unity_SHBb, tmpvar_7);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_5;
  xlv_TEXCOORD2 = (_Object2World * gl_Vertex).xyz;
  xlv_TEXCOORD3 = (x2_6 + (unity_SHC.xyz * (
    (tmpvar_5.x * tmpvar_5.x)
   - 
    (tmpvar_5.y * tmpvar_5.y)
  )));
  xlv_TEXCOORD6 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
void main ()
{
  float tmpvar_1;
  vec4 c_2;
  vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  float tmpvar_5;
  tmpvar_5 = tmpvar_4.w;
  c_2 = vec4(0.0, 0.0, 0.0, 0.0);
  tmpvar_1 = max (0.0, dot (xlv_TEXCOORD1, _WorldSpaceLightPos0.xyz));
  vec3 tmpvar_6;
  vec3 tmpvar_7;
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = xlv_TEXCOORD1;
  vec3 x1_9;
  x1_9.x = dot (unity_SHAr, tmpvar_8);
  x1_9.y = dot (unity_SHAg, tmpvar_8);
  x1_9.z = dot (unity_SHAb, tmpvar_8);
  tmpvar_6 = (xlv_TEXCOORD3 + x1_9);
  vec3 tmpvar_10;
  vec3 I_11;
  I_11 = -(tmpvar_3);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (xlv_TEXCOORD1, I_11)
   * xlv_TEXCOORD1)));
  vec3 worldNormal_12;
  worldNormal_12 = tmpvar_10;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_13;
    tmpvar_13 = normalize(tmpvar_10);
    vec3 tmpvar_14;
    tmpvar_14 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD2) / tmpvar_13);
    vec3 tmpvar_15;
    tmpvar_15 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD2) / tmpvar_13);
    bvec3 tmpvar_16;
    tmpvar_16 = greaterThan (tmpvar_13, vec3(0.0, 0.0, 0.0));
    float tmpvar_17;
    if (tmpvar_16.x) {
      tmpvar_17 = tmpvar_14.x;
    } else {
      tmpvar_17 = tmpvar_15.x;
    };
    float tmpvar_18;
    if (tmpvar_16.y) {
      tmpvar_18 = tmpvar_14.y;
    } else {
      tmpvar_18 = tmpvar_15.y;
    };
    float tmpvar_19;
    if (tmpvar_16.z) {
      tmpvar_19 = tmpvar_14.z;
    } else {
      tmpvar_19 = tmpvar_15.z;
    };
    vec3 tmpvar_20;
    tmpvar_20 = ((unity_SpecCube0_BoxMax.xyz + unity_SpecCube0_BoxMin.xyz) * 0.5);
    worldNormal_12 = (((
      (tmpvar_20 - unity_SpecCube0_ProbePosition.xyz)
     + xlv_TEXCOORD2) + (tmpvar_13 * 
      min (min (tmpvar_17, tmpvar_18), tmpvar_19)
    )) - tmpvar_20);
  };
  vec4 tmpvar_21;
  tmpvar_21.xyz = worldNormal_12;
  tmpvar_21.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
  vec4 tmpvar_22;
  tmpvar_22 = textureCubeLod (unity_SpecCube0, worldNormal_12, tmpvar_21.w);
  vec3 tmpvar_23;
  tmpvar_23 = ((unity_SpecCube0_HDR.x * pow (tmpvar_22.w, unity_SpecCube0_HDR.y)) * tmpvar_22.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldNormal_24;
    worldNormal_24 = tmpvar_10;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_25;
      tmpvar_25 = normalize(tmpvar_10);
      vec3 tmpvar_26;
      tmpvar_26 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD2) / tmpvar_25);
      vec3 tmpvar_27;
      tmpvar_27 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD2) / tmpvar_25);
      bvec3 tmpvar_28;
      tmpvar_28 = greaterThan (tmpvar_25, vec3(0.0, 0.0, 0.0));
      float tmpvar_29;
      if (tmpvar_28.x) {
        tmpvar_29 = tmpvar_26.x;
      } else {
        tmpvar_29 = tmpvar_27.x;
      };
      float tmpvar_30;
      if (tmpvar_28.y) {
        tmpvar_30 = tmpvar_26.y;
      } else {
        tmpvar_30 = tmpvar_27.y;
      };
      float tmpvar_31;
      if (tmpvar_28.z) {
        tmpvar_31 = tmpvar_26.z;
      } else {
        tmpvar_31 = tmpvar_27.z;
      };
      vec3 tmpvar_32;
      tmpvar_32 = ((unity_SpecCube1_BoxMax.xyz + unity_SpecCube1_BoxMin.xyz) * 0.5);
      worldNormal_24 = (((
        (tmpvar_32 - unity_SpecCube1_ProbePosition.xyz)
       + xlv_TEXCOORD2) + (tmpvar_25 * 
        min (min (tmpvar_29, tmpvar_30), tmpvar_31)
      )) - tmpvar_32);
    };
    vec4 tmpvar_33;
    tmpvar_33.xyz = worldNormal_24;
    tmpvar_33.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
    vec4 tmpvar_34;
    tmpvar_34 = textureCubeLod (unity_SpecCube1, worldNormal_24, tmpvar_33.w);
    tmpvar_7 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_34.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_34.xyz), tmpvar_23, unity_SpecCube0_BoxMin.www);
  } else {
    tmpvar_7 = tmpvar_23;
  };
  vec4 c_35;
  vec3 tmpvar_36;
  tmpvar_36 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_37;
  tmpvar_37 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_4.xyz, vec3(_Metallic));
  float tmpvar_38;
  tmpvar_38 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  float tmpvar_39;
  tmpvar_39 = (1.0 - _Glossiness);
  vec3 tmpvar_40;
  tmpvar_40 = normalize((_WorldSpaceLightPos0.xyz + tmpvar_3));
  float tmpvar_41;
  tmpvar_41 = max (0.0, dot (tmpvar_36, tmpvar_3));
  float tmpvar_42;
  tmpvar_42 = max (0.0, dot (_WorldSpaceLightPos0.xyz, tmpvar_40));
  float tmpvar_43;
  tmpvar_43 = ((tmpvar_39 * tmpvar_39) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_44;
  float tmpvar_45;
  tmpvar_45 = (10.0 / log2((
    ((1.0 - tmpvar_39) * 0.968)
   + 0.03)));
  tmpvar_44 = (tmpvar_45 * tmpvar_45);
  float x_46;
  x_46 = (1.0 - tmpvar_1);
  float x_47;
  x_47 = (1.0 - tmpvar_41);
  float tmpvar_48;
  tmpvar_48 = (0.5 + ((
    (2.0 * tmpvar_42)
   * tmpvar_42) * tmpvar_39));
  float x_49;
  x_49 = (1.0 - tmpvar_42);
  float x_50;
  x_50 = (1.0 - tmpvar_41);
  c_35.xyz = (((
    (tmpvar_4.xyz * tmpvar_38)
   * 
    (tmpvar_6 + (_LightColor0.xyz * ((
      (1.0 + ((tmpvar_48 - 1.0) * ((
        ((x_46 * x_46) * x_46)
       * x_46) * x_46)))
     * 
      (1.0 + ((tmpvar_48 - 1.0) * ((
        ((x_47 * x_47) * x_47)
       * x_47) * x_47)))
    ) * tmpvar_1)))
  ) + (
    (max (0.0, ((
      ((1.0/(((
        ((tmpvar_1 * (1.0 - tmpvar_43)) + tmpvar_43)
       * 
        ((tmpvar_41 * (1.0 - tmpvar_43)) + tmpvar_43)
      ) + 0.0001))) * (pow (max (0.0, 
        dot (tmpvar_36, tmpvar_40)
      ), tmpvar_44) * ((tmpvar_44 + 1.0) * unity_LightGammaCorrectionConsts.y)))
     * tmpvar_1) * unity_LightGammaCorrectionConsts.x)) * _LightColor0.xyz)
   * 
    (tmpvar_37 + ((1.0 - tmpvar_37) * ((
      ((x_49 * x_49) * x_49)
     * x_49) * x_49)))
  )) + (tmpvar_7 * mix (tmpvar_37, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_38)), 0.0, 1.0)
  ), vec3(
    ((((x_50 * x_50) * x_50) * x_50) * x_50)
  ))));
  c_35.w = tmpvar_5;
  c_2.xyz = c_35.xyz;
  c_2.w = 1.0;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 151 math, 4 textures, 9 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLSL
#ifdef VERTEX
uniform vec4 _ProjectionParams;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
varying vec4 xlv_TEXCOORD4;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  vec4 tmpvar_2;
  tmpvar_2 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 v_3;
  v_3.x = _World2Object[0].x;
  v_3.y = _World2Object[1].x;
  v_3.z = _World2Object[2].x;
  v_3.w = _World2Object[3].x;
  vec4 v_4;
  v_4.x = _World2Object[0].y;
  v_4.y = _World2Object[1].y;
  v_4.z = _World2Object[2].y;
  v_4.w = _World2Object[3].y;
  vec4 v_5;
  v_5.x = _World2Object[0].z;
  v_5.y = _World2Object[1].z;
  v_5.z = _World2Object[2].z;
  v_5.w = _World2Object[3].z;
  vec3 tmpvar_6;
  tmpvar_6 = normalize(((
    (v_3.xyz * gl_Normal.x)
   + 
    (v_4.xyz * gl_Normal.y)
  ) + (v_5.xyz * gl_Normal.z)));
  vec3 x2_7;
  vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
  x2_7.x = dot (unity_SHBr, tmpvar_8);
  x2_7.y = dot (unity_SHBg, tmpvar_8);
  x2_7.z = dot (unity_SHBb, tmpvar_8);
  vec4 o_9;
  vec4 tmpvar_10;
  tmpvar_10 = (tmpvar_2 * 0.5);
  vec2 tmpvar_11;
  tmpvar_11.x = tmpvar_10.x;
  tmpvar_11.y = (tmpvar_10.y * _ProjectionParams.x);
  o_9.xy = (tmpvar_11 + tmpvar_10.w);
  o_9.zw = tmpvar_2.zw;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = (_Object2World * gl_Vertex).xyz;
  xlv_TEXCOORD3 = (x2_7 + (unity_SHC.xyz * (
    (tmpvar_6.x * tmpvar_6.x)
   - 
    (tmpvar_6.y * tmpvar_6.y)
  )));
  xlv_TEXCOORD4 = o_9;
  xlv_TEXCOORD6 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
varying vec4 xlv_TEXCOORD4;
void main ()
{
  float tmpvar_1;
  vec4 c_2;
  vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  float tmpvar_5;
  tmpvar_5 = tmpvar_4.w;
  c_2 = vec4(0.0, 0.0, 0.0, 0.0);
  tmpvar_1 = max (0.0, dot (xlv_TEXCOORD1, _WorldSpaceLightPos0.xyz));
  vec3 tmpvar_6;
  vec3 tmpvar_7;
  vec3 tmpvar_8;
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = xlv_TEXCOORD1;
  vec3 x1_10;
  x1_10.x = dot (unity_SHAr, tmpvar_9);
  x1_10.y = dot (unity_SHAg, tmpvar_9);
  x1_10.z = dot (unity_SHAb, tmpvar_9);
  tmpvar_7 = (xlv_TEXCOORD3 + x1_10);
  tmpvar_6 = (_LightColor0.xyz * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD4).x);
  vec3 tmpvar_11;
  vec3 I_12;
  I_12 = -(tmpvar_3);
  tmpvar_11 = (I_12 - (2.0 * (
    dot (xlv_TEXCOORD1, I_12)
   * xlv_TEXCOORD1)));
  vec3 worldNormal_13;
  worldNormal_13 = tmpvar_11;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_14;
    tmpvar_14 = normalize(tmpvar_11);
    vec3 tmpvar_15;
    tmpvar_15 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD2) / tmpvar_14);
    vec3 tmpvar_16;
    tmpvar_16 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD2) / tmpvar_14);
    bvec3 tmpvar_17;
    tmpvar_17 = greaterThan (tmpvar_14, vec3(0.0, 0.0, 0.0));
    float tmpvar_18;
    if (tmpvar_17.x) {
      tmpvar_18 = tmpvar_15.x;
    } else {
      tmpvar_18 = tmpvar_16.x;
    };
    float tmpvar_19;
    if (tmpvar_17.y) {
      tmpvar_19 = tmpvar_15.y;
    } else {
      tmpvar_19 = tmpvar_16.y;
    };
    float tmpvar_20;
    if (tmpvar_17.z) {
      tmpvar_20 = tmpvar_15.z;
    } else {
      tmpvar_20 = tmpvar_16.z;
    };
    vec3 tmpvar_21;
    tmpvar_21 = ((unity_SpecCube0_BoxMax.xyz + unity_SpecCube0_BoxMin.xyz) * 0.5);
    worldNormal_13 = (((
      (tmpvar_21 - unity_SpecCube0_ProbePosition.xyz)
     + xlv_TEXCOORD2) + (tmpvar_14 * 
      min (min (tmpvar_18, tmpvar_19), tmpvar_20)
    )) - tmpvar_21);
  };
  vec4 tmpvar_22;
  tmpvar_22.xyz = worldNormal_13;
  tmpvar_22.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
  vec4 tmpvar_23;
  tmpvar_23 = textureCubeLod (unity_SpecCube0, worldNormal_13, tmpvar_22.w);
  vec3 tmpvar_24;
  tmpvar_24 = ((unity_SpecCube0_HDR.x * pow (tmpvar_23.w, unity_SpecCube0_HDR.y)) * tmpvar_23.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldNormal_25;
    worldNormal_25 = tmpvar_11;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_26;
      tmpvar_26 = normalize(tmpvar_11);
      vec3 tmpvar_27;
      tmpvar_27 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD2) / tmpvar_26);
      vec3 tmpvar_28;
      tmpvar_28 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD2) / tmpvar_26);
      bvec3 tmpvar_29;
      tmpvar_29 = greaterThan (tmpvar_26, vec3(0.0, 0.0, 0.0));
      float tmpvar_30;
      if (tmpvar_29.x) {
        tmpvar_30 = tmpvar_27.x;
      } else {
        tmpvar_30 = tmpvar_28.x;
      };
      float tmpvar_31;
      if (tmpvar_29.y) {
        tmpvar_31 = tmpvar_27.y;
      } else {
        tmpvar_31 = tmpvar_28.y;
      };
      float tmpvar_32;
      if (tmpvar_29.z) {
        tmpvar_32 = tmpvar_27.z;
      } else {
        tmpvar_32 = tmpvar_28.z;
      };
      vec3 tmpvar_33;
      tmpvar_33 = ((unity_SpecCube1_BoxMax.xyz + unity_SpecCube1_BoxMin.xyz) * 0.5);
      worldNormal_25 = (((
        (tmpvar_33 - unity_SpecCube1_ProbePosition.xyz)
       + xlv_TEXCOORD2) + (tmpvar_26 * 
        min (min (tmpvar_30, tmpvar_31), tmpvar_32)
      )) - tmpvar_33);
    };
    vec4 tmpvar_34;
    tmpvar_34.xyz = worldNormal_25;
    tmpvar_34.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
    vec4 tmpvar_35;
    tmpvar_35 = textureCubeLod (unity_SpecCube1, worldNormal_25, tmpvar_34.w);
    tmpvar_8 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_35.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_35.xyz), tmpvar_24, unity_SpecCube0_BoxMin.www);
  } else {
    tmpvar_8 = tmpvar_24;
  };
  vec4 c_36;
  vec3 tmpvar_37;
  tmpvar_37 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_38;
  tmpvar_38 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_4.xyz, vec3(_Metallic));
  float tmpvar_39;
  tmpvar_39 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  float tmpvar_40;
  tmpvar_40 = (1.0 - _Glossiness);
  vec3 tmpvar_41;
  tmpvar_41 = normalize((_WorldSpaceLightPos0.xyz + tmpvar_3));
  float tmpvar_42;
  tmpvar_42 = max (0.0, dot (tmpvar_37, tmpvar_3));
  float tmpvar_43;
  tmpvar_43 = max (0.0, dot (_WorldSpaceLightPos0.xyz, tmpvar_41));
  float tmpvar_44;
  tmpvar_44 = ((tmpvar_40 * tmpvar_40) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_45;
  float tmpvar_46;
  tmpvar_46 = (10.0 / log2((
    ((1.0 - tmpvar_40) * 0.968)
   + 0.03)));
  tmpvar_45 = (tmpvar_46 * tmpvar_46);
  float x_47;
  x_47 = (1.0 - tmpvar_1);
  float x_48;
  x_48 = (1.0 - tmpvar_42);
  float tmpvar_49;
  tmpvar_49 = (0.5 + ((
    (2.0 * tmpvar_43)
   * tmpvar_43) * tmpvar_40));
  float x_50;
  x_50 = (1.0 - tmpvar_43);
  float x_51;
  x_51 = (1.0 - tmpvar_42);
  c_36.xyz = (((
    (tmpvar_4.xyz * tmpvar_39)
   * 
    (tmpvar_7 + (tmpvar_6 * ((
      (1.0 + ((tmpvar_49 - 1.0) * ((
        ((x_47 * x_47) * x_47)
       * x_47) * x_47)))
     * 
      (1.0 + ((tmpvar_49 - 1.0) * ((
        ((x_48 * x_48) * x_48)
       * x_48) * x_48)))
    ) * tmpvar_1)))
  ) + (
    (max (0.0, ((
      ((1.0/(((
        ((tmpvar_1 * (1.0 - tmpvar_44)) + tmpvar_44)
       * 
        ((tmpvar_42 * (1.0 - tmpvar_44)) + tmpvar_44)
      ) + 0.0001))) * (pow (max (0.0, 
        dot (tmpvar_37, tmpvar_41)
      ), tmpvar_45) * ((tmpvar_45 + 1.0) * unity_LightGammaCorrectionConsts.y)))
     * tmpvar_1) * unity_LightGammaCorrectionConsts.x)) * tmpvar_6)
   * 
    (tmpvar_38 + ((1.0 - tmpvar_38) * ((
      ((x_50 * x_50) * x_50)
     * x_50) * x_50)))
  )) + (tmpvar_8 * mix (tmpvar_38, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_39)), 0.0, 1.0)
  ), vec3(
    ((((x_51 * x_51) * x_51) * x_51) * x_51)
  ))));
  c_36.w = tmpvar_5;
  c_2.xyz = c_36.xyz;
  c_2.w = 1.0;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 150 math, 3 textures, 9 branches
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLSL
#ifdef VERTEX
uniform vec4 unity_4LightPosX0;
uniform vec4 unity_4LightPosY0;
uniform vec4 unity_4LightPosZ0;
uniform vec4 unity_4LightAtten0;
uniform vec4 unity_LightColor[8];
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  vec3 tmpvar_2;
  tmpvar_2 = (_Object2World * gl_Vertex).xyz;
  vec4 v_3;
  v_3.x = _World2Object[0].x;
  v_3.y = _World2Object[1].x;
  v_3.z = _World2Object[2].x;
  v_3.w = _World2Object[3].x;
  vec4 v_4;
  v_4.x = _World2Object[0].y;
  v_4.y = _World2Object[1].y;
  v_4.z = _World2Object[2].y;
  v_4.w = _World2Object[3].y;
  vec4 v_5;
  v_5.x = _World2Object[0].z;
  v_5.y = _World2Object[1].z;
  v_5.z = _World2Object[2].z;
  v_5.w = _World2Object[3].z;
  vec3 tmpvar_6;
  tmpvar_6 = normalize(((
    (v_3.xyz * gl_Normal.x)
   + 
    (v_4.xyz * gl_Normal.y)
  ) + (v_5.xyz * gl_Normal.z)));
  vec3 x2_7;
  vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
  x2_7.x = dot (unity_SHBr, tmpvar_8);
  x2_7.y = dot (unity_SHBg, tmpvar_8);
  x2_7.z = dot (unity_SHBb, tmpvar_8);
  vec4 tmpvar_9;
  tmpvar_9 = (unity_4LightPosX0 - tmpvar_2.x);
  vec4 tmpvar_10;
  tmpvar_10 = (unity_4LightPosY0 - tmpvar_2.y);
  vec4 tmpvar_11;
  tmpvar_11 = (unity_4LightPosZ0 - tmpvar_2.z);
  vec4 tmpvar_12;
  tmpvar_12 = (((tmpvar_9 * tmpvar_9) + (tmpvar_10 * tmpvar_10)) + (tmpvar_11 * tmpvar_11));
  vec4 tmpvar_13;
  tmpvar_13 = (max (vec4(0.0, 0.0, 0.0, 0.0), (
    (((tmpvar_9 * tmpvar_6.x) + (tmpvar_10 * tmpvar_6.y)) + (tmpvar_11 * tmpvar_6.z))
   * 
    inversesqrt(tmpvar_12)
  )) * (1.0/((1.0 + 
    (tmpvar_12 * unity_4LightAtten0)
  ))));
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = ((x2_7 + (unity_SHC.xyz * 
    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
  )) + ((
    ((unity_LightColor[0].xyz * tmpvar_13.x) + (unity_LightColor[1].xyz * tmpvar_13.y))
   + 
    (unity_LightColor[2].xyz * tmpvar_13.z)
  ) + (unity_LightColor[3].xyz * tmpvar_13.w)));
  xlv_TEXCOORD6 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
void main ()
{
  float tmpvar_1;
  vec4 c_2;
  vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  float tmpvar_5;
  tmpvar_5 = tmpvar_4.w;
  c_2 = vec4(0.0, 0.0, 0.0, 0.0);
  tmpvar_1 = max (0.0, dot (xlv_TEXCOORD1, _WorldSpaceLightPos0.xyz));
  vec3 tmpvar_6;
  vec3 tmpvar_7;
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = xlv_TEXCOORD1;
  vec3 x1_9;
  x1_9.x = dot (unity_SHAr, tmpvar_8);
  x1_9.y = dot (unity_SHAg, tmpvar_8);
  x1_9.z = dot (unity_SHAb, tmpvar_8);
  tmpvar_6 = (xlv_TEXCOORD3 + x1_9);
  vec3 tmpvar_10;
  vec3 I_11;
  I_11 = -(tmpvar_3);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (xlv_TEXCOORD1, I_11)
   * xlv_TEXCOORD1)));
  vec3 worldNormal_12;
  worldNormal_12 = tmpvar_10;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_13;
    tmpvar_13 = normalize(tmpvar_10);
    vec3 tmpvar_14;
    tmpvar_14 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD2) / tmpvar_13);
    vec3 tmpvar_15;
    tmpvar_15 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD2) / tmpvar_13);
    bvec3 tmpvar_16;
    tmpvar_16 = greaterThan (tmpvar_13, vec3(0.0, 0.0, 0.0));
    float tmpvar_17;
    if (tmpvar_16.x) {
      tmpvar_17 = tmpvar_14.x;
    } else {
      tmpvar_17 = tmpvar_15.x;
    };
    float tmpvar_18;
    if (tmpvar_16.y) {
      tmpvar_18 = tmpvar_14.y;
    } else {
      tmpvar_18 = tmpvar_15.y;
    };
    float tmpvar_19;
    if (tmpvar_16.z) {
      tmpvar_19 = tmpvar_14.z;
    } else {
      tmpvar_19 = tmpvar_15.z;
    };
    vec3 tmpvar_20;
    tmpvar_20 = ((unity_SpecCube0_BoxMax.xyz + unity_SpecCube0_BoxMin.xyz) * 0.5);
    worldNormal_12 = (((
      (tmpvar_20 - unity_SpecCube0_ProbePosition.xyz)
     + xlv_TEXCOORD2) + (tmpvar_13 * 
      min (min (tmpvar_17, tmpvar_18), tmpvar_19)
    )) - tmpvar_20);
  };
  vec4 tmpvar_21;
  tmpvar_21.xyz = worldNormal_12;
  tmpvar_21.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
  vec4 tmpvar_22;
  tmpvar_22 = textureCubeLod (unity_SpecCube0, worldNormal_12, tmpvar_21.w);
  vec3 tmpvar_23;
  tmpvar_23 = ((unity_SpecCube0_HDR.x * pow (tmpvar_22.w, unity_SpecCube0_HDR.y)) * tmpvar_22.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldNormal_24;
    worldNormal_24 = tmpvar_10;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_25;
      tmpvar_25 = normalize(tmpvar_10);
      vec3 tmpvar_26;
      tmpvar_26 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD2) / tmpvar_25);
      vec3 tmpvar_27;
      tmpvar_27 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD2) / tmpvar_25);
      bvec3 tmpvar_28;
      tmpvar_28 = greaterThan (tmpvar_25, vec3(0.0, 0.0, 0.0));
      float tmpvar_29;
      if (tmpvar_28.x) {
        tmpvar_29 = tmpvar_26.x;
      } else {
        tmpvar_29 = tmpvar_27.x;
      };
      float tmpvar_30;
      if (tmpvar_28.y) {
        tmpvar_30 = tmpvar_26.y;
      } else {
        tmpvar_30 = tmpvar_27.y;
      };
      float tmpvar_31;
      if (tmpvar_28.z) {
        tmpvar_31 = tmpvar_26.z;
      } else {
        tmpvar_31 = tmpvar_27.z;
      };
      vec3 tmpvar_32;
      tmpvar_32 = ((unity_SpecCube1_BoxMax.xyz + unity_SpecCube1_BoxMin.xyz) * 0.5);
      worldNormal_24 = (((
        (tmpvar_32 - unity_SpecCube1_ProbePosition.xyz)
       + xlv_TEXCOORD2) + (tmpvar_25 * 
        min (min (tmpvar_29, tmpvar_30), tmpvar_31)
      )) - tmpvar_32);
    };
    vec4 tmpvar_33;
    tmpvar_33.xyz = worldNormal_24;
    tmpvar_33.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
    vec4 tmpvar_34;
    tmpvar_34 = textureCubeLod (unity_SpecCube1, worldNormal_24, tmpvar_33.w);
    tmpvar_7 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_34.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_34.xyz), tmpvar_23, unity_SpecCube0_BoxMin.www);
  } else {
    tmpvar_7 = tmpvar_23;
  };
  vec4 c_35;
  vec3 tmpvar_36;
  tmpvar_36 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_37;
  tmpvar_37 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_4.xyz, vec3(_Metallic));
  float tmpvar_38;
  tmpvar_38 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  float tmpvar_39;
  tmpvar_39 = (1.0 - _Glossiness);
  vec3 tmpvar_40;
  tmpvar_40 = normalize((_WorldSpaceLightPos0.xyz + tmpvar_3));
  float tmpvar_41;
  tmpvar_41 = max (0.0, dot (tmpvar_36, tmpvar_3));
  float tmpvar_42;
  tmpvar_42 = max (0.0, dot (_WorldSpaceLightPos0.xyz, tmpvar_40));
  float tmpvar_43;
  tmpvar_43 = ((tmpvar_39 * tmpvar_39) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_44;
  float tmpvar_45;
  tmpvar_45 = (10.0 / log2((
    ((1.0 - tmpvar_39) * 0.968)
   + 0.03)));
  tmpvar_44 = (tmpvar_45 * tmpvar_45);
  float x_46;
  x_46 = (1.0 - tmpvar_1);
  float x_47;
  x_47 = (1.0 - tmpvar_41);
  float tmpvar_48;
  tmpvar_48 = (0.5 + ((
    (2.0 * tmpvar_42)
   * tmpvar_42) * tmpvar_39));
  float x_49;
  x_49 = (1.0 - tmpvar_42);
  float x_50;
  x_50 = (1.0 - tmpvar_41);
  c_35.xyz = (((
    (tmpvar_4.xyz * tmpvar_38)
   * 
    (tmpvar_6 + (_LightColor0.xyz * ((
      (1.0 + ((tmpvar_48 - 1.0) * ((
        ((x_46 * x_46) * x_46)
       * x_46) * x_46)))
     * 
      (1.0 + ((tmpvar_48 - 1.0) * ((
        ((x_47 * x_47) * x_47)
       * x_47) * x_47)))
    ) * tmpvar_1)))
  ) + (
    (max (0.0, ((
      ((1.0/(((
        ((tmpvar_1 * (1.0 - tmpvar_43)) + tmpvar_43)
       * 
        ((tmpvar_41 * (1.0 - tmpvar_43)) + tmpvar_43)
      ) + 0.0001))) * (pow (max (0.0, 
        dot (tmpvar_36, tmpvar_40)
      ), tmpvar_44) * ((tmpvar_44 + 1.0) * unity_LightGammaCorrectionConsts.y)))
     * tmpvar_1) * unity_LightGammaCorrectionConsts.x)) * _LightColor0.xyz)
   * 
    (tmpvar_37 + ((1.0 - tmpvar_37) * ((
      ((x_49 * x_49) * x_49)
     * x_49) * x_49)))
  )) + (tmpvar_7 * mix (tmpvar_37, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_38)), 0.0, 1.0)
  ), vec3(
    ((((x_50 * x_50) * x_50) * x_50) * x_50)
  ))));
  c_35.w = tmpvar_5;
  c_2.xyz = c_35.xyz;
  c_2.w = 1.0;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 151 math, 4 textures, 9 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLSL
#ifdef VERTEX
uniform vec4 _ProjectionParams;
uniform vec4 unity_4LightPosX0;
uniform vec4 unity_4LightPosY0;
uniform vec4 unity_4LightPosZ0;
uniform vec4 unity_4LightAtten0;
uniform vec4 unity_LightColor[8];
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
varying vec4 xlv_TEXCOORD4;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  vec4 tmpvar_2;
  tmpvar_2 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec3 tmpvar_3;
  tmpvar_3 = (_Object2World * gl_Vertex).xyz;
  vec4 v_4;
  v_4.x = _World2Object[0].x;
  v_4.y = _World2Object[1].x;
  v_4.z = _World2Object[2].x;
  v_4.w = _World2Object[3].x;
  vec4 v_5;
  v_5.x = _World2Object[0].y;
  v_5.y = _World2Object[1].y;
  v_5.z = _World2Object[2].y;
  v_5.w = _World2Object[3].y;
  vec4 v_6;
  v_6.x = _World2Object[0].z;
  v_6.y = _World2Object[1].z;
  v_6.z = _World2Object[2].z;
  v_6.w = _World2Object[3].z;
  vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * gl_Normal.x)
   + 
    (v_5.xyz * gl_Normal.y)
  ) + (v_6.xyz * gl_Normal.z)));
  vec3 x2_8;
  vec4 tmpvar_9;
  tmpvar_9 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
  x2_8.x = dot (unity_SHBr, tmpvar_9);
  x2_8.y = dot (unity_SHBg, tmpvar_9);
  x2_8.z = dot (unity_SHBb, tmpvar_9);
  vec4 tmpvar_10;
  tmpvar_10 = (unity_4LightPosX0 - tmpvar_3.x);
  vec4 tmpvar_11;
  tmpvar_11 = (unity_4LightPosY0 - tmpvar_3.y);
  vec4 tmpvar_12;
  tmpvar_12 = (unity_4LightPosZ0 - tmpvar_3.z);
  vec4 tmpvar_13;
  tmpvar_13 = (((tmpvar_10 * tmpvar_10) + (tmpvar_11 * tmpvar_11)) + (tmpvar_12 * tmpvar_12));
  vec4 tmpvar_14;
  tmpvar_14 = (max (vec4(0.0, 0.0, 0.0, 0.0), (
    (((tmpvar_10 * tmpvar_7.x) + (tmpvar_11 * tmpvar_7.y)) + (tmpvar_12 * tmpvar_7.z))
   * 
    inversesqrt(tmpvar_13)
  )) * (1.0/((1.0 + 
    (tmpvar_13 * unity_4LightAtten0)
  ))));
  vec4 o_15;
  vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_2 * 0.5);
  vec2 tmpvar_17;
  tmpvar_17.x = tmpvar_16.x;
  tmpvar_17.y = (tmpvar_16.y * _ProjectionParams.x);
  o_15.xy = (tmpvar_17 + tmpvar_16.w);
  o_15.zw = tmpvar_2.zw;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = ((x2_8 + (unity_SHC.xyz * 
    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
  )) + ((
    ((unity_LightColor[0].xyz * tmpvar_14.x) + (unity_LightColor[1].xyz * tmpvar_14.y))
   + 
    (unity_LightColor[2].xyz * tmpvar_14.z)
  ) + (unity_LightColor[3].xyz * tmpvar_14.w)));
  xlv_TEXCOORD4 = o_15;
  xlv_TEXCOORD6 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
varying vec4 xlv_TEXCOORD4;
void main ()
{
  float tmpvar_1;
  vec4 c_2;
  vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  float tmpvar_5;
  tmpvar_5 = tmpvar_4.w;
  c_2 = vec4(0.0, 0.0, 0.0, 0.0);
  tmpvar_1 = max (0.0, dot (xlv_TEXCOORD1, _WorldSpaceLightPos0.xyz));
  vec3 tmpvar_6;
  vec3 tmpvar_7;
  vec3 tmpvar_8;
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = xlv_TEXCOORD1;
  vec3 x1_10;
  x1_10.x = dot (unity_SHAr, tmpvar_9);
  x1_10.y = dot (unity_SHAg, tmpvar_9);
  x1_10.z = dot (unity_SHAb, tmpvar_9);
  tmpvar_7 = (xlv_TEXCOORD3 + x1_10);
  tmpvar_6 = (_LightColor0.xyz * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD4).x);
  vec3 tmpvar_11;
  vec3 I_12;
  I_12 = -(tmpvar_3);
  tmpvar_11 = (I_12 - (2.0 * (
    dot (xlv_TEXCOORD1, I_12)
   * xlv_TEXCOORD1)));
  vec3 worldNormal_13;
  worldNormal_13 = tmpvar_11;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_14;
    tmpvar_14 = normalize(tmpvar_11);
    vec3 tmpvar_15;
    tmpvar_15 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD2) / tmpvar_14);
    vec3 tmpvar_16;
    tmpvar_16 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD2) / tmpvar_14);
    bvec3 tmpvar_17;
    tmpvar_17 = greaterThan (tmpvar_14, vec3(0.0, 0.0, 0.0));
    float tmpvar_18;
    if (tmpvar_17.x) {
      tmpvar_18 = tmpvar_15.x;
    } else {
      tmpvar_18 = tmpvar_16.x;
    };
    float tmpvar_19;
    if (tmpvar_17.y) {
      tmpvar_19 = tmpvar_15.y;
    } else {
      tmpvar_19 = tmpvar_16.y;
    };
    float tmpvar_20;
    if (tmpvar_17.z) {
      tmpvar_20 = tmpvar_15.z;
    } else {
      tmpvar_20 = tmpvar_16.z;
    };
    vec3 tmpvar_21;
    tmpvar_21 = ((unity_SpecCube0_BoxMax.xyz + unity_SpecCube0_BoxMin.xyz) * 0.5);
    worldNormal_13 = (((
      (tmpvar_21 - unity_SpecCube0_ProbePosition.xyz)
     + xlv_TEXCOORD2) + (tmpvar_14 * 
      min (min (tmpvar_18, tmpvar_19), tmpvar_20)
    )) - tmpvar_21);
  };
  vec4 tmpvar_22;
  tmpvar_22.xyz = worldNormal_13;
  tmpvar_22.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
  vec4 tmpvar_23;
  tmpvar_23 = textureCubeLod (unity_SpecCube0, worldNormal_13, tmpvar_22.w);
  vec3 tmpvar_24;
  tmpvar_24 = ((unity_SpecCube0_HDR.x * pow (tmpvar_23.w, unity_SpecCube0_HDR.y)) * tmpvar_23.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldNormal_25;
    worldNormal_25 = tmpvar_11;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_26;
      tmpvar_26 = normalize(tmpvar_11);
      vec3 tmpvar_27;
      tmpvar_27 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD2) / tmpvar_26);
      vec3 tmpvar_28;
      tmpvar_28 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD2) / tmpvar_26);
      bvec3 tmpvar_29;
      tmpvar_29 = greaterThan (tmpvar_26, vec3(0.0, 0.0, 0.0));
      float tmpvar_30;
      if (tmpvar_29.x) {
        tmpvar_30 = tmpvar_27.x;
      } else {
        tmpvar_30 = tmpvar_28.x;
      };
      float tmpvar_31;
      if (tmpvar_29.y) {
        tmpvar_31 = tmpvar_27.y;
      } else {
        tmpvar_31 = tmpvar_28.y;
      };
      float tmpvar_32;
      if (tmpvar_29.z) {
        tmpvar_32 = tmpvar_27.z;
      } else {
        tmpvar_32 = tmpvar_28.z;
      };
      vec3 tmpvar_33;
      tmpvar_33 = ((unity_SpecCube1_BoxMax.xyz + unity_SpecCube1_BoxMin.xyz) * 0.5);
      worldNormal_25 = (((
        (tmpvar_33 - unity_SpecCube1_ProbePosition.xyz)
       + xlv_TEXCOORD2) + (tmpvar_26 * 
        min (min (tmpvar_30, tmpvar_31), tmpvar_32)
      )) - tmpvar_33);
    };
    vec4 tmpvar_34;
    tmpvar_34.xyz = worldNormal_25;
    tmpvar_34.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
    vec4 tmpvar_35;
    tmpvar_35 = textureCubeLod (unity_SpecCube1, worldNormal_25, tmpvar_34.w);
    tmpvar_8 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_35.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_35.xyz), tmpvar_24, unity_SpecCube0_BoxMin.www);
  } else {
    tmpvar_8 = tmpvar_24;
  };
  vec4 c_36;
  vec3 tmpvar_37;
  tmpvar_37 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_38;
  tmpvar_38 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_4.xyz, vec3(_Metallic));
  float tmpvar_39;
  tmpvar_39 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  float tmpvar_40;
  tmpvar_40 = (1.0 - _Glossiness);
  vec3 tmpvar_41;
  tmpvar_41 = normalize((_WorldSpaceLightPos0.xyz + tmpvar_3));
  float tmpvar_42;
  tmpvar_42 = max (0.0, dot (tmpvar_37, tmpvar_3));
  float tmpvar_43;
  tmpvar_43 = max (0.0, dot (_WorldSpaceLightPos0.xyz, tmpvar_41));
  float tmpvar_44;
  tmpvar_44 = ((tmpvar_40 * tmpvar_40) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_45;
  float tmpvar_46;
  tmpvar_46 = (10.0 / log2((
    ((1.0 - tmpvar_40) * 0.968)
   + 0.03)));
  tmpvar_45 = (tmpvar_46 * tmpvar_46);
  float x_47;
  x_47 = (1.0 - tmpvar_1);
  float x_48;
  x_48 = (1.0 - tmpvar_42);
  float tmpvar_49;
  tmpvar_49 = (0.5 + ((
    (2.0 * tmpvar_43)
   * tmpvar_43) * tmpvar_40));
  float x_50;
  x_50 = (1.0 - tmpvar_43);
  float x_51;
  x_51 = (1.0 - tmpvar_42);
  c_36.xyz = (((
    (tmpvar_4.xyz * tmpvar_39)
   * 
    (tmpvar_7 + (tmpvar_6 * ((
      (1.0 + ((tmpvar_49 - 1.0) * ((
        ((x_47 * x_47) * x_47)
       * x_47) * x_47)))
     * 
      (1.0 + ((tmpvar_49 - 1.0) * ((
        ((x_48 * x_48) * x_48)
       * x_48) * x_48)))
    ) * tmpvar_1)))
  ) + (
    (max (0.0, ((
      ((1.0/(((
        ((tmpvar_1 * (1.0 - tmpvar_44)) + tmpvar_44)
       * 
        ((tmpvar_42 * (1.0 - tmpvar_44)) + tmpvar_44)
      ) + 0.0001))) * (pow (max (0.0, 
        dot (tmpvar_37, tmpvar_41)
      ), tmpvar_45) * ((tmpvar_45 + 1.0) * unity_LightGammaCorrectionConsts.y)))
     * tmpvar_1) * unity_LightGammaCorrectionConsts.x)) * tmpvar_6)
   * 
    (tmpvar_38 + ((1.0 - tmpvar_38) * ((
      ((x_50 * x_50) * x_50)
     * x_50) * x_50)))
  )) + (tmpvar_8 * mix (tmpvar_38, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_39)), 0.0, 1.0)
  ), vec3(
    ((((x_51 * x_51) * x_51) * x_51) * x_51)
  ))));
  c_36.w = tmpvar_5;
  c_2.xyz = c_36.xyz;
  c_2.w = 1.0;
  gl_FragData[0] = c_2;
}


#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLSL"
}
}
 }


 // Stats for Vertex shader:
 //      opengl : 90 avg math (80..102), 3 avg texture (1..7), 0 avg branch (0..4)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
  ZWrite Off
  Blend One One
  GpuProgramID 105500
Program "vp" {
SubProgram "opengl " {
// Stats: 86 math, 2 textures
Keywords { "POINT" "SHADOWS_OFF" }
"!!GLSL
#ifdef VERTEX

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
void main ()
{
  vec4 v_1;
  v_1.x = _World2Object[0].x;
  v_1.y = _World2Object[1].x;
  v_1.z = _World2Object[2].x;
  v_1.w = _World2Object[3].x;
  vec4 v_2;
  v_2.x = _World2Object[0].y;
  v_2.y = _World2Object[1].y;
  v_2.z = _World2Object[2].y;
  v_2.w = _World2Object[3].y;
  vec4 v_3;
  v_3.x = _World2Object[0].z;
  v_3.y = _World2Object[1].z;
  v_3.z = _World2Object[2].z;
  v_3.w = _World2Object[3].z;
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  xlv_TEXCOORD2 = (_Object2World * gl_Vertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _LightTexture0;
uniform mat4 _LightMatrix0;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
void main ()
{
  vec3 tmpvar_1;
  vec3 tmpvar_2;
  float tmpvar_3;
  vec4 c_4;
  vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = xlv_TEXCOORD2;
  vec3 tmpvar_8;
  tmpvar_8 = (_LightMatrix0 * tmpvar_7).xyz;
  tmpvar_2 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  tmpvar_3 = max (0.0, dot (xlv_TEXCOORD1, tmpvar_2));
  tmpvar_1 = (_LightColor0.xyz * texture2D (_LightTexture0, vec2(dot (tmpvar_8, tmpvar_8))).w);
  vec4 c_9;
  vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_11;
  tmpvar_11 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_6.xyz, vec3(_Metallic));
  float tmpvar_12;
  tmpvar_12 = (1.0 - _Glossiness);
  vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_2 + tmpvar_5));
  float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_10, tmpvar_5));
  float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_2, tmpvar_13));
  float tmpvar_16;
  tmpvar_16 = ((tmpvar_12 * tmpvar_12) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_17;
  float tmpvar_18;
  tmpvar_18 = (10.0 / log2((
    ((1.0 - tmpvar_12) * 0.968)
   + 0.03)));
  tmpvar_17 = (tmpvar_18 * tmpvar_18);
  float x_19;
  x_19 = (1.0 - tmpvar_3);
  float x_20;
  x_20 = (1.0 - tmpvar_14);
  float tmpvar_21;
  tmpvar_21 = (0.5 + ((
    (2.0 * tmpvar_15)
   * tmpvar_15) * tmpvar_12));
  float x_22;
  x_22 = (1.0 - tmpvar_15);
  c_9.xyz = (((tmpvar_6.xyz * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_1 * 
    (((1.0 + (
      (tmpvar_21 - 1.0)
     * 
      ((((x_19 * x_19) * x_19) * x_19) * x_19)
    )) * (1.0 + (
      (tmpvar_21 - 1.0)
     * 
      ((((x_20 * x_20) * x_20) * x_20) * x_20)
    ))) * tmpvar_3)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_3 * (1.0 - tmpvar_16))
       + tmpvar_16) * (
        (tmpvar_14 * (1.0 - tmpvar_16))
       + tmpvar_16)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_10, tmpvar_13)), tmpvar_17) * ((tmpvar_17 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_3) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_1) * (tmpvar_11 + 
    ((1.0 - tmpvar_11) * (((
      (x_22 * x_22)
     * x_22) * x_22) * x_22))
  )));
  c_9.w = tmpvar_6.w;
  c_4.xyz = c_9.xyz;
  c_4.w = 1.0;
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 80 math, 1 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"!!GLSL
#ifdef VERTEX

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
void main ()
{
  vec4 v_1;
  v_1.x = _World2Object[0].x;
  v_1.y = _World2Object[1].x;
  v_1.z = _World2Object[2].x;
  v_1.w = _World2Object[3].x;
  vec4 v_2;
  v_2.x = _World2Object[0].y;
  v_2.y = _World2Object[1].y;
  v_2.z = _World2Object[2].y;
  v_2.w = _World2Object[3].y;
  vec4 v_3;
  v_3.x = _World2Object[0].z;
  v_3.y = _World2Object[1].z;
  v_3.z = _World2Object[2].z;
  v_3.w = _World2Object[3].z;
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  xlv_TEXCOORD2 = (_Object2World * gl_Vertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
void main ()
{
  float tmpvar_1;
  vec4 c_2;
  vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_1 = max (0.0, dot (xlv_TEXCOORD1, _WorldSpaceLightPos0.xyz));
  vec4 c_5;
  vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_7;
  tmpvar_7 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_4.xyz, vec3(_Metallic));
  float tmpvar_8;
  tmpvar_8 = (1.0 - _Glossiness);
  vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz + tmpvar_3));
  float tmpvar_10;
  tmpvar_10 = max (0.0, dot (tmpvar_6, tmpvar_3));
  float tmpvar_11;
  tmpvar_11 = max (0.0, dot (_WorldSpaceLightPos0.xyz, tmpvar_9));
  float tmpvar_12;
  tmpvar_12 = ((tmpvar_8 * tmpvar_8) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_13;
  float tmpvar_14;
  tmpvar_14 = (10.0 / log2((
    ((1.0 - tmpvar_8) * 0.968)
   + 0.03)));
  tmpvar_13 = (tmpvar_14 * tmpvar_14);
  float x_15;
  x_15 = (1.0 - tmpvar_1);
  float x_16;
  x_16 = (1.0 - tmpvar_10);
  float tmpvar_17;
  tmpvar_17 = (0.5 + ((
    (2.0 * tmpvar_11)
   * tmpvar_11) * tmpvar_8));
  float x_18;
  x_18 = (1.0 - tmpvar_11);
  c_5.xyz = (((tmpvar_4.xyz * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (_LightColor0.xyz * 
    (((1.0 + (
      (tmpvar_17 - 1.0)
     * 
      ((((x_15 * x_15) * x_15) * x_15) * x_15)
    )) * (1.0 + (
      (tmpvar_17 - 1.0)
     * 
      ((((x_16 * x_16) * x_16) * x_16) * x_16)
    ))) * tmpvar_1)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_1 * (1.0 - tmpvar_12))
       + tmpvar_12) * (
        (tmpvar_10 * (1.0 - tmpvar_12))
       + tmpvar_12)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_6, tmpvar_9)), tmpvar_13) * ((tmpvar_13 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_1) * unity_LightGammaCorrectionConsts.x))
   * _LightColor0.xyz) * (tmpvar_7 + 
    ((1.0 - tmpvar_7) * (((
      (x_18 * x_18)
     * x_18) * x_18) * x_18))
  )));
  c_5.w = tmpvar_4.w;
  c_2.xyz = c_5.xyz;
  c_2.w = 1.0;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 92 math, 3 textures
Keywords { "SPOT" "SHADOWS_OFF" }
"!!GLSL
#ifdef VERTEX

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
void main ()
{
  vec4 v_1;
  v_1.x = _World2Object[0].x;
  v_1.y = _World2Object[1].x;
  v_1.z = _World2Object[2].x;
  v_1.w = _World2Object[3].x;
  vec4 v_2;
  v_2.x = _World2Object[0].y;
  v_2.y = _World2Object[1].y;
  v_2.z = _World2Object[2].y;
  v_2.w = _World2Object[3].y;
  vec4 v_3;
  v_3.x = _World2Object[0].z;
  v_3.y = _World2Object[1].z;
  v_3.z = _World2Object[2].z;
  v_3.w = _World2Object[3].z;
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  xlv_TEXCOORD2 = (_Object2World * gl_Vertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _LightTexture0;
uniform mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
void main ()
{
  vec3 tmpvar_1;
  vec3 tmpvar_2;
  float tmpvar_3;
  vec4 c_4;
  vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = xlv_TEXCOORD2;
  vec4 tmpvar_8;
  tmpvar_8 = (_LightMatrix0 * tmpvar_7);
  tmpvar_2 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  tmpvar_3 = max (0.0, dot (xlv_TEXCOORD1, tmpvar_2));
  tmpvar_1 = (_LightColor0.xyz * ((
    float((tmpvar_8.z > 0.0))
   * texture2D (_LightTexture0, 
    ((tmpvar_8.xy / tmpvar_8.w) + 0.5)
  ).w) * texture2D (_LightTextureB0, vec2(dot (tmpvar_8.xyz, tmpvar_8.xyz))).w));
  vec4 c_9;
  vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_11;
  tmpvar_11 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_6.xyz, vec3(_Metallic));
  float tmpvar_12;
  tmpvar_12 = (1.0 - _Glossiness);
  vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_2 + tmpvar_5));
  float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_10, tmpvar_5));
  float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_2, tmpvar_13));
  float tmpvar_16;
  tmpvar_16 = ((tmpvar_12 * tmpvar_12) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_17;
  float tmpvar_18;
  tmpvar_18 = (10.0 / log2((
    ((1.0 - tmpvar_12) * 0.968)
   + 0.03)));
  tmpvar_17 = (tmpvar_18 * tmpvar_18);
  float x_19;
  x_19 = (1.0 - tmpvar_3);
  float x_20;
  x_20 = (1.0 - tmpvar_14);
  float tmpvar_21;
  tmpvar_21 = (0.5 + ((
    (2.0 * tmpvar_15)
   * tmpvar_15) * tmpvar_12));
  float x_22;
  x_22 = (1.0 - tmpvar_15);
  c_9.xyz = (((tmpvar_6.xyz * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_1 * 
    (((1.0 + (
      (tmpvar_21 - 1.0)
     * 
      ((((x_19 * x_19) * x_19) * x_19) * x_19)
    )) * (1.0 + (
      (tmpvar_21 - 1.0)
     * 
      ((((x_20 * x_20) * x_20) * x_20) * x_20)
    ))) * tmpvar_3)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_3 * (1.0 - tmpvar_16))
       + tmpvar_16) * (
        (tmpvar_14 * (1.0 - tmpvar_16))
       + tmpvar_16)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_10, tmpvar_13)), tmpvar_17) * ((tmpvar_17 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_3) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_1) * (tmpvar_11 + 
    ((1.0 - tmpvar_11) * (((
      (x_22 * x_22)
     * x_22) * x_22) * x_22))
  )));
  c_9.w = tmpvar_6.w;
  c_4.xyz = c_9.xyz;
  c_4.w = 1.0;
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 87 math, 3 textures
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"!!GLSL
#ifdef VERTEX

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
void main ()
{
  vec4 v_1;
  v_1.x = _World2Object[0].x;
  v_1.y = _World2Object[1].x;
  v_1.z = _World2Object[2].x;
  v_1.w = _World2Object[3].x;
  vec4 v_2;
  v_2.x = _World2Object[0].y;
  v_2.y = _World2Object[1].y;
  v_2.z = _World2Object[2].y;
  v_2.w = _World2Object[3].y;
  vec4 v_3;
  v_3.x = _World2Object[0].z;
  v_3.y = _World2Object[1].z;
  v_3.z = _World2Object[2].z;
  v_3.w = _World2Object[3].z;
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  xlv_TEXCOORD2 = (_Object2World * gl_Vertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform samplerCube _LightTexture0;
uniform mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
void main ()
{
  vec3 tmpvar_1;
  vec3 tmpvar_2;
  float tmpvar_3;
  vec4 c_4;
  vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = xlv_TEXCOORD2;
  vec3 tmpvar_8;
  tmpvar_8 = (_LightMatrix0 * tmpvar_7).xyz;
  tmpvar_2 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  tmpvar_3 = max (0.0, dot (xlv_TEXCOORD1, tmpvar_2));
  tmpvar_1 = (_LightColor0.xyz * (texture2D (_LightTextureB0, vec2(dot (tmpvar_8, tmpvar_8))).w * textureCube (_LightTexture0, tmpvar_8).w));
  vec4 c_9;
  vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_11;
  tmpvar_11 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_6.xyz, vec3(_Metallic));
  float tmpvar_12;
  tmpvar_12 = (1.0 - _Glossiness);
  vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_2 + tmpvar_5));
  float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_10, tmpvar_5));
  float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_2, tmpvar_13));
  float tmpvar_16;
  tmpvar_16 = ((tmpvar_12 * tmpvar_12) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_17;
  float tmpvar_18;
  tmpvar_18 = (10.0 / log2((
    ((1.0 - tmpvar_12) * 0.968)
   + 0.03)));
  tmpvar_17 = (tmpvar_18 * tmpvar_18);
  float x_19;
  x_19 = (1.0 - tmpvar_3);
  float x_20;
  x_20 = (1.0 - tmpvar_14);
  float tmpvar_21;
  tmpvar_21 = (0.5 + ((
    (2.0 * tmpvar_15)
   * tmpvar_15) * tmpvar_12));
  float x_22;
  x_22 = (1.0 - tmpvar_15);
  c_9.xyz = (((tmpvar_6.xyz * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_1 * 
    (((1.0 + (
      (tmpvar_21 - 1.0)
     * 
      ((((x_19 * x_19) * x_19) * x_19) * x_19)
    )) * (1.0 + (
      (tmpvar_21 - 1.0)
     * 
      ((((x_20 * x_20) * x_20) * x_20) * x_20)
    ))) * tmpvar_3)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_3 * (1.0 - tmpvar_16))
       + tmpvar_16) * (
        (tmpvar_14 * (1.0 - tmpvar_16))
       + tmpvar_16)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_10, tmpvar_13)), tmpvar_17) * ((tmpvar_17 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_3) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_1) * (tmpvar_11 + 
    ((1.0 - tmpvar_11) * (((
      (x_22 * x_22)
     * x_22) * x_22) * x_22))
  )));
  c_9.w = tmpvar_6.w;
  c_4.xyz = c_9.xyz;
  c_4.w = 1.0;
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 83 math, 2 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"!!GLSL
#ifdef VERTEX

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
void main ()
{
  vec4 v_1;
  v_1.x = _World2Object[0].x;
  v_1.y = _World2Object[1].x;
  v_1.z = _World2Object[2].x;
  v_1.w = _World2Object[3].x;
  vec4 v_2;
  v_2.x = _World2Object[0].y;
  v_2.y = _World2Object[1].y;
  v_2.z = _World2Object[2].y;
  v_2.w = _World2Object[3].y;
  vec4 v_3;
  v_3.x = _World2Object[0].z;
  v_3.y = _World2Object[1].z;
  v_3.z = _World2Object[2].z;
  v_3.w = _World2Object[3].z;
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  xlv_TEXCOORD2 = (_Object2World * gl_Vertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _LightTexture0;
uniform mat4 _LightMatrix0;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
void main ()
{
  vec3 tmpvar_1;
  float tmpvar_2;
  vec4 c_3;
  vec3 tmpvar_4;
  tmpvar_4 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = xlv_TEXCOORD2;
  tmpvar_2 = max (0.0, dot (xlv_TEXCOORD1, _WorldSpaceLightPos0.xyz));
  tmpvar_1 = (_LightColor0.xyz * texture2D (_LightTexture0, (_LightMatrix0 * tmpvar_6).xy).w);
  vec4 c_7;
  vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_9;
  tmpvar_9 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_5.xyz, vec3(_Metallic));
  float tmpvar_10;
  tmpvar_10 = (1.0 - _Glossiness);
  vec3 tmpvar_11;
  tmpvar_11 = normalize((_WorldSpaceLightPos0.xyz + tmpvar_4));
  float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_8, tmpvar_4));
  float tmpvar_13;
  tmpvar_13 = max (0.0, dot (_WorldSpaceLightPos0.xyz, tmpvar_11));
  float tmpvar_14;
  tmpvar_14 = ((tmpvar_10 * tmpvar_10) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_15;
  float tmpvar_16;
  tmpvar_16 = (10.0 / log2((
    ((1.0 - tmpvar_10) * 0.968)
   + 0.03)));
  tmpvar_15 = (tmpvar_16 * tmpvar_16);
  float x_17;
  x_17 = (1.0 - tmpvar_2);
  float x_18;
  x_18 = (1.0 - tmpvar_12);
  float tmpvar_19;
  tmpvar_19 = (0.5 + ((
    (2.0 * tmpvar_13)
   * tmpvar_13) * tmpvar_10));
  float x_20;
  x_20 = (1.0 - tmpvar_13);
  c_7.xyz = (((tmpvar_5.xyz * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_1 * 
    (((1.0 + (
      (tmpvar_19 - 1.0)
     * 
      ((((x_17 * x_17) * x_17) * x_17) * x_17)
    )) * (1.0 + (
      (tmpvar_19 - 1.0)
     * 
      ((((x_18 * x_18) * x_18) * x_18) * x_18)
    ))) * tmpvar_2)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_2 * (1.0 - tmpvar_14))
       + tmpvar_14) * (
        (tmpvar_12 * (1.0 - tmpvar_14))
       + tmpvar_14)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_8, tmpvar_11)), tmpvar_15) * ((tmpvar_15 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_2) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_1) * (tmpvar_9 + 
    ((1.0 - tmpvar_9) * (((
      (x_20 * x_20)
     * x_20) * x_20) * x_20))
  )));
  c_7.w = tmpvar_5.w;
  c_3.xyz = c_7.xyz;
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 96 math, 4 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"!!GLSL
#ifdef VERTEX
uniform mat4 unity_World2Shadow[4];

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 v_1;
  v_1.x = _World2Object[0].x;
  v_1.y = _World2Object[1].x;
  v_1.z = _World2Object[2].x;
  v_1.w = _World2Object[3].x;
  vec4 v_2;
  v_2.x = _World2Object[0].y;
  v_2.y = _World2Object[1].y;
  v_2.z = _World2Object[2].y;
  v_2.w = _World2Object[3].y;
  vec4 v_3;
  v_3.x = _World2Object[0].z;
  v_3.y = _World2Object[1].z;
  v_3.z = _World2Object[2].z;
  v_3.w = _World2Object[3].z;
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 cse_4;
  cse_4 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD2 = cse_4.xyz;
  xlv_TEXCOORD3 = (unity_World2Shadow[0] * cse_4);
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform sampler2DShadow _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
void main ()
{
  vec3 tmpvar_1;
  vec3 tmpvar_2;
  float tmpvar_3;
  vec4 c_4;
  vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = xlv_TEXCOORD2;
  vec4 tmpvar_8;
  tmpvar_8 = (_LightMatrix0 * tmpvar_7);
  tmpvar_2 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  tmpvar_3 = max (0.0, dot (xlv_TEXCOORD1, tmpvar_2));
  tmpvar_1 = (_LightColor0.xyz * ((
    (float((tmpvar_8.z > 0.0)) * texture2D (_LightTexture0, ((tmpvar_8.xy / tmpvar_8.w) + 0.5)).w)
   * texture2D (_LightTextureB0, vec2(
    dot (tmpvar_8.xyz, tmpvar_8.xyz)
  )).w) * (_LightShadowData.x + 
    (shadow2DProj (_ShadowMapTexture, xlv_TEXCOORD3).x * (1.0 - _LightShadowData.x))
  )));
  vec4 c_9;
  vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_11;
  tmpvar_11 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_6.xyz, vec3(_Metallic));
  float tmpvar_12;
  tmpvar_12 = (1.0 - _Glossiness);
  vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_2 + tmpvar_5));
  float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_10, tmpvar_5));
  float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_2, tmpvar_13));
  float tmpvar_16;
  tmpvar_16 = ((tmpvar_12 * tmpvar_12) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_17;
  float tmpvar_18;
  tmpvar_18 = (10.0 / log2((
    ((1.0 - tmpvar_12) * 0.968)
   + 0.03)));
  tmpvar_17 = (tmpvar_18 * tmpvar_18);
  float x_19;
  x_19 = (1.0 - tmpvar_3);
  float x_20;
  x_20 = (1.0 - tmpvar_14);
  float tmpvar_21;
  tmpvar_21 = (0.5 + ((
    (2.0 * tmpvar_15)
   * tmpvar_15) * tmpvar_12));
  float x_22;
  x_22 = (1.0 - tmpvar_15);
  c_9.xyz = (((tmpvar_6.xyz * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_1 * 
    (((1.0 + (
      (tmpvar_21 - 1.0)
     * 
      ((((x_19 * x_19) * x_19) * x_19) * x_19)
    )) * (1.0 + (
      (tmpvar_21 - 1.0)
     * 
      ((((x_20 * x_20) * x_20) * x_20) * x_20)
    ))) * tmpvar_3)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_3 * (1.0 - tmpvar_16))
       + tmpvar_16) * (
        (tmpvar_14 * (1.0 - tmpvar_16))
       + tmpvar_16)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_10, tmpvar_13)), tmpvar_17) * ((tmpvar_17 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_3) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_1) * (tmpvar_11 + 
    ((1.0 - tmpvar_11) * (((
      (x_22 * x_22)
     * x_22) * x_22) * x_22))
  )));
  c_9.w = tmpvar_6.w;
  c_4.xyz = c_9.xyz;
  c_4.w = 1.0;
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 81 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"!!GLSL
#ifdef VERTEX
uniform vec4 _ProjectionParams;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 v_2;
  v_2.x = _World2Object[0].x;
  v_2.y = _World2Object[1].x;
  v_2.z = _World2Object[2].x;
  v_2.w = _World2Object[3].x;
  vec4 v_3;
  v_3.x = _World2Object[0].y;
  v_3.y = _World2Object[1].y;
  v_3.z = _World2Object[2].y;
  v_3.w = _World2Object[3].y;
  vec4 v_4;
  v_4.x = _World2Object[0].z;
  v_4.y = _World2Object[1].z;
  v_4.z = _World2Object[2].z;
  v_4.w = _World2Object[3].z;
  vec4 o_5;
  vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_1 * 0.5);
  vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_1.zw;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize(((
    (v_2.xyz * gl_Normal.x)
   + 
    (v_3.xyz * gl_Normal.y)
  ) + (v_4.xyz * gl_Normal.z)));
  xlv_TEXCOORD2 = (_Object2World * gl_Vertex).xyz;
  xlv_TEXCOORD3 = o_5;
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
void main ()
{
  vec3 tmpvar_1;
  float tmpvar_2;
  vec4 c_3;
  vec3 tmpvar_4;
  tmpvar_4 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_2 = max (0.0, dot (xlv_TEXCOORD1, _WorldSpaceLightPos0.xyz));
  tmpvar_1 = (_LightColor0.xyz * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD3).x);
  vec4 c_6;
  vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_8;
  tmpvar_8 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_5.xyz, vec3(_Metallic));
  float tmpvar_9;
  tmpvar_9 = (1.0 - _Glossiness);
  vec3 tmpvar_10;
  tmpvar_10 = normalize((_WorldSpaceLightPos0.xyz + tmpvar_4));
  float tmpvar_11;
  tmpvar_11 = max (0.0, dot (tmpvar_7, tmpvar_4));
  float tmpvar_12;
  tmpvar_12 = max (0.0, dot (_WorldSpaceLightPos0.xyz, tmpvar_10));
  float tmpvar_13;
  tmpvar_13 = ((tmpvar_9 * tmpvar_9) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_14;
  float tmpvar_15;
  tmpvar_15 = (10.0 / log2((
    ((1.0 - tmpvar_9) * 0.968)
   + 0.03)));
  tmpvar_14 = (tmpvar_15 * tmpvar_15);
  float x_16;
  x_16 = (1.0 - tmpvar_2);
  float x_17;
  x_17 = (1.0 - tmpvar_11);
  float tmpvar_18;
  tmpvar_18 = (0.5 + ((
    (2.0 * tmpvar_12)
   * tmpvar_12) * tmpvar_9));
  float x_19;
  x_19 = (1.0 - tmpvar_12);
  c_6.xyz = (((tmpvar_5.xyz * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_1 * 
    (((1.0 + (
      (tmpvar_18 - 1.0)
     * 
      ((((x_16 * x_16) * x_16) * x_16) * x_16)
    )) * (1.0 + (
      (tmpvar_18 - 1.0)
     * 
      ((((x_17 * x_17) * x_17) * x_17) * x_17)
    ))) * tmpvar_2)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_2 * (1.0 - tmpvar_13))
       + tmpvar_13) * (
        (tmpvar_11 * (1.0 - tmpvar_13))
       + tmpvar_13)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_7, tmpvar_10)), tmpvar_14) * ((tmpvar_14 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_2) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_1) * (tmpvar_8 + 
    ((1.0 - tmpvar_8) * (((
      (x_19 * x_19)
     * x_19) * x_19) * x_19))
  )));
  c_6.w = tmpvar_5.w;
  c_3.xyz = c_6.xyz;
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 84 math, 3 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"!!GLSL
#ifdef VERTEX
uniform vec4 _ProjectionParams;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 v_2;
  v_2.x = _World2Object[0].x;
  v_2.y = _World2Object[1].x;
  v_2.z = _World2Object[2].x;
  v_2.w = _World2Object[3].x;
  vec4 v_3;
  v_3.x = _World2Object[0].y;
  v_3.y = _World2Object[1].y;
  v_3.z = _World2Object[2].y;
  v_3.w = _World2Object[3].y;
  vec4 v_4;
  v_4.x = _World2Object[0].z;
  v_4.y = _World2Object[1].z;
  v_4.z = _World2Object[2].z;
  v_4.w = _World2Object[3].z;
  vec4 o_5;
  vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_1 * 0.5);
  vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_1.zw;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize(((
    (v_2.xyz * gl_Normal.x)
   + 
    (v_3.xyz * gl_Normal.y)
  ) + (v_4.xyz * gl_Normal.z)));
  xlv_TEXCOORD2 = (_Object2World * gl_Vertex).xyz;
  xlv_TEXCOORD3 = o_5;
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform mat4 _LightMatrix0;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
void main ()
{
  vec3 tmpvar_1;
  float tmpvar_2;
  vec4 c_3;
  vec3 tmpvar_4;
  tmpvar_4 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = xlv_TEXCOORD2;
  tmpvar_2 = max (0.0, dot (xlv_TEXCOORD1, _WorldSpaceLightPos0.xyz));
  tmpvar_1 = (_LightColor0.xyz * (texture2D (_LightTexture0, (_LightMatrix0 * tmpvar_6).xy).w * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD3).x));
  vec4 c_7;
  vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_9;
  tmpvar_9 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_5.xyz, vec3(_Metallic));
  float tmpvar_10;
  tmpvar_10 = (1.0 - _Glossiness);
  vec3 tmpvar_11;
  tmpvar_11 = normalize((_WorldSpaceLightPos0.xyz + tmpvar_4));
  float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_8, tmpvar_4));
  float tmpvar_13;
  tmpvar_13 = max (0.0, dot (_WorldSpaceLightPos0.xyz, tmpvar_11));
  float tmpvar_14;
  tmpvar_14 = ((tmpvar_10 * tmpvar_10) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_15;
  float tmpvar_16;
  tmpvar_16 = (10.0 / log2((
    ((1.0 - tmpvar_10) * 0.968)
   + 0.03)));
  tmpvar_15 = (tmpvar_16 * tmpvar_16);
  float x_17;
  x_17 = (1.0 - tmpvar_2);
  float x_18;
  x_18 = (1.0 - tmpvar_12);
  float tmpvar_19;
  tmpvar_19 = (0.5 + ((
    (2.0 * tmpvar_13)
   * tmpvar_13) * tmpvar_10));
  float x_20;
  x_20 = (1.0 - tmpvar_13);
  c_7.xyz = (((tmpvar_5.xyz * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_1 * 
    (((1.0 + (
      (tmpvar_19 - 1.0)
     * 
      ((((x_17 * x_17) * x_17) * x_17) * x_17)
    )) * (1.0 + (
      (tmpvar_19 - 1.0)
     * 
      ((((x_18 * x_18) * x_18) * x_18) * x_18)
    ))) * tmpvar_2)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_2 * (1.0 - tmpvar_14))
       + tmpvar_14) * (
        (tmpvar_12 * (1.0 - tmpvar_14))
       + tmpvar_14)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_8, tmpvar_11)), tmpvar_15) * ((tmpvar_15 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_2) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_1) * (tmpvar_9 + 
    ((1.0 - tmpvar_9) * (((
      (x_20 * x_20)
     * x_20) * x_20) * x_20))
  )));
  c_7.w = tmpvar_5.w;
  c_3.xyz = c_7.xyz;
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 93 math, 3 textures, 1 branches
Keywords { "POINT" "SHADOWS_CUBE" }
"!!GLSL
#ifdef VERTEX
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 v_1;
  v_1.x = _World2Object[0].x;
  v_1.y = _World2Object[1].x;
  v_1.z = _World2Object[2].x;
  v_1.w = _World2Object[3].x;
  vec4 v_2;
  v_2.x = _World2Object[0].y;
  v_2.y = _World2Object[1].y;
  v_2.z = _World2Object[2].y;
  v_2.w = _World2Object[3].y;
  vec4 v_3;
  v_3.x = _World2Object[0].z;
  v_3.y = _World2Object[1].z;
  v_3.z = _World2Object[2].z;
  v_3.w = _World2Object[3].z;
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 cse_4;
  cse_4 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD2 = cse_4.xyz;
  xlv_TEXCOORD3 = (cse_4.xyz - _LightPositionRange.xyz);
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightPositionRange;
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform samplerCube _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform mat4 _LightMatrix0;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
void main ()
{
  vec3 tmpvar_1;
  float tmpvar_2;
  vec4 c_3;
  vec3 tmpvar_4;
  tmpvar_4 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  float tmpvar_7;
  tmpvar_7 = tmpvar_6.w;
  vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = xlv_TEXCOORD2;
  vec3 tmpvar_9;
  tmpvar_9 = (_LightMatrix0 * tmpvar_8).xyz;
  vec4 tmpvar_10;
  tmpvar_10 = texture2D (_LightTexture0, vec2(dot (tmpvar_9, tmpvar_9)));
  float tmpvar_11;
  tmpvar_11 = ((sqrt(
    dot (xlv_TEXCOORD3, xlv_TEXCOORD3)
  ) * _LightPositionRange.w) * 0.97);
  vec4 tmpvar_12;
  tmpvar_12 = textureCube (_ShadowMapTexture, xlv_TEXCOORD3);
  float tmpvar_13;
  if ((tmpvar_12.x < tmpvar_11)) {
    tmpvar_13 = _LightShadowData.x;
  } else {
    tmpvar_13 = 1.0;
  };
  tmpvar_2 = max (0.0, dot (xlv_TEXCOORD1, tmpvar_4));
  tmpvar_1 = (_LightColor0.xyz * (tmpvar_10.w * tmpvar_13));
  vec4 c_14;
  vec3 tmpvar_15;
  tmpvar_15 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_16;
  tmpvar_16 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_6.xyz, vec3(_Metallic));
  float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  vec3 tmpvar_18;
  tmpvar_18 = normalize((tmpvar_4 + tmpvar_5));
  float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_15, tmpvar_5));
  float tmpvar_20;
  tmpvar_20 = max (0.0, dot (tmpvar_4, tmpvar_18));
  float tmpvar_21;
  tmpvar_21 = ((tmpvar_17 * tmpvar_17) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_22;
  float tmpvar_23;
  tmpvar_23 = (10.0 / log2((
    ((1.0 - tmpvar_17) * 0.968)
   + 0.03)));
  tmpvar_22 = (tmpvar_23 * tmpvar_23);
  float x_24;
  x_24 = (1.0 - tmpvar_2);
  float x_25;
  x_25 = (1.0 - tmpvar_19);
  float tmpvar_26;
  tmpvar_26 = (0.5 + ((
    (2.0 * tmpvar_20)
   * tmpvar_20) * tmpvar_17));
  float x_27;
  x_27 = (1.0 - tmpvar_20);
  c_14.xyz = (((tmpvar_6.xyz * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_1 * 
    (((1.0 + (
      (tmpvar_26 - 1.0)
     * 
      ((((x_24 * x_24) * x_24) * x_24) * x_24)
    )) * (1.0 + (
      (tmpvar_26 - 1.0)
     * 
      ((((x_25 * x_25) * x_25) * x_25) * x_25)
    ))) * tmpvar_2)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_2 * (1.0 - tmpvar_21))
       + tmpvar_21) * (
        (tmpvar_19 * (1.0 - tmpvar_21))
       + tmpvar_21)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_15, tmpvar_18)), tmpvar_22) * ((tmpvar_22 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_2) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_1) * (tmpvar_16 + 
    ((1.0 - tmpvar_16) * (((
      (x_27 * x_27)
     * x_27) * x_27) * x_27))
  )));
  c_14.w = tmpvar_7;
  c_3.xyz = c_14.xyz;
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 94 math, 4 textures, 1 branches
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"!!GLSL
#ifdef VERTEX
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 v_1;
  v_1.x = _World2Object[0].x;
  v_1.y = _World2Object[1].x;
  v_1.z = _World2Object[2].x;
  v_1.w = _World2Object[3].x;
  vec4 v_2;
  v_2.x = _World2Object[0].y;
  v_2.y = _World2Object[1].y;
  v_2.z = _World2Object[2].y;
  v_2.w = _World2Object[3].y;
  vec4 v_3;
  v_3.x = _World2Object[0].z;
  v_3.y = _World2Object[1].z;
  v_3.z = _World2Object[2].z;
  v_3.w = _World2Object[3].z;
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 cse_4;
  cse_4 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD2 = cse_4.xyz;
  xlv_TEXCOORD3 = (cse_4.xyz - _LightPositionRange.xyz);
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightPositionRange;
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform samplerCube _ShadowMapTexture;
uniform samplerCube _LightTexture0;
uniform mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
void main ()
{
  vec3 tmpvar_1;
  float tmpvar_2;
  vec4 c_3;
  vec3 tmpvar_4;
  tmpvar_4 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  float tmpvar_7;
  tmpvar_7 = tmpvar_6.w;
  vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = xlv_TEXCOORD2;
  vec3 tmpvar_9;
  tmpvar_9 = (_LightMatrix0 * tmpvar_8).xyz;
  vec4 tmpvar_10;
  tmpvar_10 = texture2D (_LightTextureB0, vec2(dot (tmpvar_9, tmpvar_9)));
  vec4 tmpvar_11;
  tmpvar_11 = textureCube (_LightTexture0, tmpvar_9);
  float tmpvar_12;
  tmpvar_12 = ((sqrt(
    dot (xlv_TEXCOORD3, xlv_TEXCOORD3)
  ) * _LightPositionRange.w) * 0.97);
  vec4 tmpvar_13;
  tmpvar_13 = textureCube (_ShadowMapTexture, xlv_TEXCOORD3);
  float tmpvar_14;
  if ((tmpvar_13.x < tmpvar_12)) {
    tmpvar_14 = _LightShadowData.x;
  } else {
    tmpvar_14 = 1.0;
  };
  tmpvar_2 = max (0.0, dot (xlv_TEXCOORD1, tmpvar_4));
  tmpvar_1 = (_LightColor0.xyz * ((tmpvar_10.w * tmpvar_11.w) * tmpvar_14));
  vec4 c_15;
  vec3 tmpvar_16;
  tmpvar_16 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_17;
  tmpvar_17 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_6.xyz, vec3(_Metallic));
  float tmpvar_18;
  tmpvar_18 = (1.0 - _Glossiness);
  vec3 tmpvar_19;
  tmpvar_19 = normalize((tmpvar_4 + tmpvar_5));
  float tmpvar_20;
  tmpvar_20 = max (0.0, dot (tmpvar_16, tmpvar_5));
  float tmpvar_21;
  tmpvar_21 = max (0.0, dot (tmpvar_4, tmpvar_19));
  float tmpvar_22;
  tmpvar_22 = ((tmpvar_18 * tmpvar_18) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_23;
  float tmpvar_24;
  tmpvar_24 = (10.0 / log2((
    ((1.0 - tmpvar_18) * 0.968)
   + 0.03)));
  tmpvar_23 = (tmpvar_24 * tmpvar_24);
  float x_25;
  x_25 = (1.0 - tmpvar_2);
  float x_26;
  x_26 = (1.0 - tmpvar_20);
  float tmpvar_27;
  tmpvar_27 = (0.5 + ((
    (2.0 * tmpvar_21)
   * tmpvar_21) * tmpvar_18));
  float x_28;
  x_28 = (1.0 - tmpvar_21);
  c_15.xyz = (((tmpvar_6.xyz * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_1 * 
    (((1.0 + (
      (tmpvar_27 - 1.0)
     * 
      ((((x_25 * x_25) * x_25) * x_25) * x_25)
    )) * (1.0 + (
      (tmpvar_27 - 1.0)
     * 
      ((((x_26 * x_26) * x_26) * x_26) * x_26)
    ))) * tmpvar_2)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_2 * (1.0 - tmpvar_22))
       + tmpvar_22) * (
        (tmpvar_20 * (1.0 - tmpvar_22))
       + tmpvar_22)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_16, tmpvar_19)), tmpvar_23) * ((tmpvar_23 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_2) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_1) * (tmpvar_17 + 
    ((1.0 - tmpvar_17) * (((
      (x_28 * x_28)
     * x_28) * x_28) * x_28))
  )));
  c_15.w = tmpvar_7;
  c_3.xyz = c_15.xyz;
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 102 math, 7 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"!!GLSL
#ifdef VERTEX
uniform mat4 unity_World2Shadow[4];

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 v_1;
  v_1.x = _World2Object[0].x;
  v_1.y = _World2Object[1].x;
  v_1.z = _World2Object[2].x;
  v_1.w = _World2Object[3].x;
  vec4 v_2;
  v_2.x = _World2Object[0].y;
  v_2.y = _World2Object[1].y;
  v_2.z = _World2Object[2].y;
  v_2.w = _World2Object[3].y;
  vec4 v_3;
  v_3.x = _World2Object[0].z;
  v_3.y = _World2Object[1].z;
  v_3.z = _World2Object[2].z;
  v_3.w = _World2Object[3].z;
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 cse_4;
  cse_4 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD2 = cse_4.xyz;
  xlv_TEXCOORD3 = (unity_World2Shadow[0] * cse_4);
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform sampler2DShadow _ShadowMapTexture;
uniform vec4 _ShadowOffsets[4];
uniform sampler2D _LightTexture0;
uniform mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
void main ()
{
  vec3 tmpvar_1;
  vec3 tmpvar_2;
  float tmpvar_3;
  vec4 c_4;
  vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = xlv_TEXCOORD2;
  vec4 tmpvar_8;
  tmpvar_8 = (_LightMatrix0 * tmpvar_7);
  vec4 shadows_9;
  vec3 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD3.xyz / xlv_TEXCOORD3.w);
  shadows_9.x = shadow2D (_ShadowMapTexture, (tmpvar_10 + _ShadowOffsets[0].xyz)).x;
  shadows_9.y = shadow2D (_ShadowMapTexture, (tmpvar_10 + _ShadowOffsets[1].xyz)).x;
  shadows_9.z = shadow2D (_ShadowMapTexture, (tmpvar_10 + _ShadowOffsets[2].xyz)).x;
  shadows_9.w = shadow2D (_ShadowMapTexture, (tmpvar_10 + _ShadowOffsets[3].xyz)).x;
  vec4 tmpvar_11;
  tmpvar_11 = (_LightShadowData.xxxx + (shadows_9 * (1.0 - _LightShadowData.xxxx)));
  shadows_9 = tmpvar_11;
  tmpvar_2 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  tmpvar_3 = max (0.0, dot (xlv_TEXCOORD1, tmpvar_2));
  tmpvar_1 = (_LightColor0.xyz * ((
    (float((tmpvar_8.z > 0.0)) * texture2D (_LightTexture0, ((tmpvar_8.xy / tmpvar_8.w) + 0.5)).w)
   * texture2D (_LightTextureB0, vec2(
    dot (tmpvar_8.xyz, tmpvar_8.xyz)
  )).w) * dot (tmpvar_11, vec4(0.25, 0.25, 0.25, 0.25))));
  vec4 c_12;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_14;
  tmpvar_14 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_6.xyz, vec3(_Metallic));
  float tmpvar_15;
  tmpvar_15 = (1.0 - _Glossiness);
  vec3 tmpvar_16;
  tmpvar_16 = normalize((tmpvar_2 + tmpvar_5));
  float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_13, tmpvar_5));
  float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_2, tmpvar_16));
  float tmpvar_19;
  tmpvar_19 = ((tmpvar_15 * tmpvar_15) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_20;
  float tmpvar_21;
  tmpvar_21 = (10.0 / log2((
    ((1.0 - tmpvar_15) * 0.968)
   + 0.03)));
  tmpvar_20 = (tmpvar_21 * tmpvar_21);
  float x_22;
  x_22 = (1.0 - tmpvar_3);
  float x_23;
  x_23 = (1.0 - tmpvar_17);
  float tmpvar_24;
  tmpvar_24 = (0.5 + ((
    (2.0 * tmpvar_18)
   * tmpvar_18) * tmpvar_15));
  float x_25;
  x_25 = (1.0 - tmpvar_18);
  c_12.xyz = (((tmpvar_6.xyz * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_1 * 
    (((1.0 + (
      (tmpvar_24 - 1.0)
     * 
      ((((x_22 * x_22) * x_22) * x_22) * x_22)
    )) * (1.0 + (
      (tmpvar_24 - 1.0)
     * 
      ((((x_23 * x_23) * x_23) * x_23) * x_23)
    ))) * tmpvar_3)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_3 * (1.0 - tmpvar_19))
       + tmpvar_19) * (
        (tmpvar_17 * (1.0 - tmpvar_19))
       + tmpvar_19)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_13, tmpvar_16)), tmpvar_20) * ((tmpvar_20 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_3) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_1) * (tmpvar_14 + 
    ((1.0 - tmpvar_14) * (((
      (x_25 * x_25)
     * x_25) * x_25) * x_25))
  )));
  c_12.w = tmpvar_6.w;
  c_4.xyz = c_12.xyz;
  c_4.w = 1.0;
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 101 math, 6 textures, 4 branches
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLSL
#ifdef VERTEX
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 v_1;
  v_1.x = _World2Object[0].x;
  v_1.y = _World2Object[1].x;
  v_1.z = _World2Object[2].x;
  v_1.w = _World2Object[3].x;
  vec4 v_2;
  v_2.x = _World2Object[0].y;
  v_2.y = _World2Object[1].y;
  v_2.z = _World2Object[2].y;
  v_2.w = _World2Object[3].y;
  vec4 v_3;
  v_3.x = _World2Object[0].z;
  v_3.y = _World2Object[1].z;
  v_3.z = _World2Object[2].z;
  v_3.w = _World2Object[3].z;
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 cse_4;
  cse_4 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD2 = cse_4.xyz;
  xlv_TEXCOORD3 = (cse_4.xyz - _LightPositionRange.xyz);
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightPositionRange;
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform samplerCube _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform mat4 _LightMatrix0;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
void main ()
{
  vec3 tmpvar_1;
  float tmpvar_2;
  vec4 c_3;
  vec3 tmpvar_4;
  tmpvar_4 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  float tmpvar_7;
  tmpvar_7 = tmpvar_6.w;
  vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = xlv_TEXCOORD2;
  vec3 tmpvar_9;
  tmpvar_9 = (_LightMatrix0 * tmpvar_8).xyz;
  vec4 tmpvar_10;
  tmpvar_10 = texture2D (_LightTexture0, vec2(dot (tmpvar_9, tmpvar_9)));
  vec4 shadowVals_11;
  shadowVals_11.x = textureCube (_ShadowMapTexture, (xlv_TEXCOORD3 + vec3(0.0078125, 0.0078125, 0.0078125))).x;
  shadowVals_11.y = textureCube (_ShadowMapTexture, (xlv_TEXCOORD3 + vec3(-0.0078125, -0.0078125, 0.0078125))).x;
  shadowVals_11.z = textureCube (_ShadowMapTexture, (xlv_TEXCOORD3 + vec3(-0.0078125, 0.0078125, -0.0078125))).x;
  shadowVals_11.w = textureCube (_ShadowMapTexture, (xlv_TEXCOORD3 + vec3(0.0078125, -0.0078125, -0.0078125))).x;
  bvec4 tmpvar_12;
  tmpvar_12 = lessThan (shadowVals_11, vec4(((
    sqrt(dot (xlv_TEXCOORD3, xlv_TEXCOORD3))
   * _LightPositionRange.w) * 0.97)));
  vec4 tmpvar_13;
  tmpvar_13 = _LightShadowData.xxxx;
  float tmpvar_14;
  if (tmpvar_12.x) {
    tmpvar_14 = tmpvar_13.x;
  } else {
    tmpvar_14 = 1.0;
  };
  float tmpvar_15;
  if (tmpvar_12.y) {
    tmpvar_15 = tmpvar_13.y;
  } else {
    tmpvar_15 = 1.0;
  };
  float tmpvar_16;
  if (tmpvar_12.z) {
    tmpvar_16 = tmpvar_13.z;
  } else {
    tmpvar_16 = 1.0;
  };
  float tmpvar_17;
  if (tmpvar_12.w) {
    tmpvar_17 = tmpvar_13.w;
  } else {
    tmpvar_17 = 1.0;
  };
  vec4 tmpvar_18;
  tmpvar_18.x = tmpvar_14;
  tmpvar_18.y = tmpvar_15;
  tmpvar_18.z = tmpvar_16;
  tmpvar_18.w = tmpvar_17;
  tmpvar_2 = max (0.0, dot (xlv_TEXCOORD1, tmpvar_4));
  tmpvar_1 = (_LightColor0.xyz * (tmpvar_10.w * dot (tmpvar_18, vec4(0.25, 0.25, 0.25, 0.25))));
  vec4 c_19;
  vec3 tmpvar_20;
  tmpvar_20 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_21;
  tmpvar_21 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_6.xyz, vec3(_Metallic));
  float tmpvar_22;
  tmpvar_22 = (1.0 - _Glossiness);
  vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_4 + tmpvar_5));
  float tmpvar_24;
  tmpvar_24 = max (0.0, dot (tmpvar_20, tmpvar_5));
  float tmpvar_25;
  tmpvar_25 = max (0.0, dot (tmpvar_4, tmpvar_23));
  float tmpvar_26;
  tmpvar_26 = ((tmpvar_22 * tmpvar_22) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_27;
  float tmpvar_28;
  tmpvar_28 = (10.0 / log2((
    ((1.0 - tmpvar_22) * 0.968)
   + 0.03)));
  tmpvar_27 = (tmpvar_28 * tmpvar_28);
  float x_29;
  x_29 = (1.0 - tmpvar_2);
  float x_30;
  x_30 = (1.0 - tmpvar_24);
  float tmpvar_31;
  tmpvar_31 = (0.5 + ((
    (2.0 * tmpvar_25)
   * tmpvar_25) * tmpvar_22));
  float x_32;
  x_32 = (1.0 - tmpvar_25);
  c_19.xyz = (((tmpvar_6.xyz * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_1 * 
    (((1.0 + (
      (tmpvar_31 - 1.0)
     * 
      ((((x_29 * x_29) * x_29) * x_29) * x_29)
    )) * (1.0 + (
      (tmpvar_31 - 1.0)
     * 
      ((((x_30 * x_30) * x_30) * x_30) * x_30)
    ))) * tmpvar_2)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_2 * (1.0 - tmpvar_26))
       + tmpvar_26) * (
        (tmpvar_24 * (1.0 - tmpvar_26))
       + tmpvar_26)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_20, tmpvar_23)), tmpvar_27) * ((tmpvar_27 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_2) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_1) * (tmpvar_21 + 
    ((1.0 - tmpvar_21) * (((
      (x_32 * x_32)
     * x_32) * x_32) * x_32))
  )));
  c_19.w = tmpvar_7;
  c_3.xyz = c_19.xyz;
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 102 math, 7 textures, 4 branches
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLSL
#ifdef VERTEX
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 v_1;
  v_1.x = _World2Object[0].x;
  v_1.y = _World2Object[1].x;
  v_1.z = _World2Object[2].x;
  v_1.w = _World2Object[3].x;
  vec4 v_2;
  v_2.x = _World2Object[0].y;
  v_2.y = _World2Object[1].y;
  v_2.z = _World2Object[2].y;
  v_2.w = _World2Object[3].y;
  vec4 v_3;
  v_3.x = _World2Object[0].z;
  v_3.y = _World2Object[1].z;
  v_3.z = _World2Object[2].z;
  v_3.w = _World2Object[3].z;
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 cse_4;
  cse_4 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD2 = cse_4.xyz;
  xlv_TEXCOORD3 = (cse_4.xyz - _LightPositionRange.xyz);
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightPositionRange;
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform samplerCube _ShadowMapTexture;
uniform samplerCube _LightTexture0;
uniform mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
void main ()
{
  vec3 tmpvar_1;
  float tmpvar_2;
  vec4 c_3;
  vec3 tmpvar_4;
  tmpvar_4 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  float tmpvar_7;
  tmpvar_7 = tmpvar_6.w;
  vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = xlv_TEXCOORD2;
  vec3 tmpvar_9;
  tmpvar_9 = (_LightMatrix0 * tmpvar_8).xyz;
  vec4 tmpvar_10;
  tmpvar_10 = texture2D (_LightTextureB0, vec2(dot (tmpvar_9, tmpvar_9)));
  vec4 tmpvar_11;
  tmpvar_11 = textureCube (_LightTexture0, tmpvar_9);
  vec4 shadowVals_12;
  shadowVals_12.x = textureCube (_ShadowMapTexture, (xlv_TEXCOORD3 + vec3(0.0078125, 0.0078125, 0.0078125))).x;
  shadowVals_12.y = textureCube (_ShadowMapTexture, (xlv_TEXCOORD3 + vec3(-0.0078125, -0.0078125, 0.0078125))).x;
  shadowVals_12.z = textureCube (_ShadowMapTexture, (xlv_TEXCOORD3 + vec3(-0.0078125, 0.0078125, -0.0078125))).x;
  shadowVals_12.w = textureCube (_ShadowMapTexture, (xlv_TEXCOORD3 + vec3(0.0078125, -0.0078125, -0.0078125))).x;
  bvec4 tmpvar_13;
  tmpvar_13 = lessThan (shadowVals_12, vec4(((
    sqrt(dot (xlv_TEXCOORD3, xlv_TEXCOORD3))
   * _LightPositionRange.w) * 0.97)));
  vec4 tmpvar_14;
  tmpvar_14 = _LightShadowData.xxxx;
  float tmpvar_15;
  if (tmpvar_13.x) {
    tmpvar_15 = tmpvar_14.x;
  } else {
    tmpvar_15 = 1.0;
  };
  float tmpvar_16;
  if (tmpvar_13.y) {
    tmpvar_16 = tmpvar_14.y;
  } else {
    tmpvar_16 = 1.0;
  };
  float tmpvar_17;
  if (tmpvar_13.z) {
    tmpvar_17 = tmpvar_14.z;
  } else {
    tmpvar_17 = 1.0;
  };
  float tmpvar_18;
  if (tmpvar_13.w) {
    tmpvar_18 = tmpvar_14.w;
  } else {
    tmpvar_18 = 1.0;
  };
  vec4 tmpvar_19;
  tmpvar_19.x = tmpvar_15;
  tmpvar_19.y = tmpvar_16;
  tmpvar_19.z = tmpvar_17;
  tmpvar_19.w = tmpvar_18;
  tmpvar_2 = max (0.0, dot (xlv_TEXCOORD1, tmpvar_4));
  tmpvar_1 = (_LightColor0.xyz * ((tmpvar_10.w * tmpvar_11.w) * dot (tmpvar_19, vec4(0.25, 0.25, 0.25, 0.25))));
  vec4 c_20;
  vec3 tmpvar_21;
  tmpvar_21 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_22;
  tmpvar_22 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_6.xyz, vec3(_Metallic));
  float tmpvar_23;
  tmpvar_23 = (1.0 - _Glossiness);
  vec3 tmpvar_24;
  tmpvar_24 = normalize((tmpvar_4 + tmpvar_5));
  float tmpvar_25;
  tmpvar_25 = max (0.0, dot (tmpvar_21, tmpvar_5));
  float tmpvar_26;
  tmpvar_26 = max (0.0, dot (tmpvar_4, tmpvar_24));
  float tmpvar_27;
  tmpvar_27 = ((tmpvar_23 * tmpvar_23) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_28;
  float tmpvar_29;
  tmpvar_29 = (10.0 / log2((
    ((1.0 - tmpvar_23) * 0.968)
   + 0.03)));
  tmpvar_28 = (tmpvar_29 * tmpvar_29);
  float x_30;
  x_30 = (1.0 - tmpvar_2);
  float x_31;
  x_31 = (1.0 - tmpvar_25);
  float tmpvar_32;
  tmpvar_32 = (0.5 + ((
    (2.0 * tmpvar_26)
   * tmpvar_26) * tmpvar_23));
  float x_33;
  x_33 = (1.0 - tmpvar_26);
  c_20.xyz = (((tmpvar_6.xyz * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_1 * 
    (((1.0 + (
      (tmpvar_32 - 1.0)
     * 
      ((((x_30 * x_30) * x_30) * x_30) * x_30)
    )) * (1.0 + (
      (tmpvar_32 - 1.0)
     * 
      ((((x_31 * x_31) * x_31) * x_31) * x_31)
    ))) * tmpvar_2)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_2 * (1.0 - tmpvar_27))
       + tmpvar_27) * (
        (tmpvar_25 * (1.0 - tmpvar_27))
       + tmpvar_27)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_21, tmpvar_24)), tmpvar_28) * ((tmpvar_28 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_2) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_1) * (tmpvar_22 + 
    ((1.0 - tmpvar_22) * (((
      (x_33 * x_33)
     * x_33) * x_33) * x_33))
  )));
  c_20.w = tmpvar_7;
  c_3.xyz = c_20.xyz;
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_CUBE" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLSL"
}
}
 }


 // Stats for Vertex shader:
 //      opengl : 86 avg math (85..87), 3 texture, 9 branch
 Pass {
  Name "DEFERRED"
  Tags { "LIGHTMODE"="Deferred" "RenderType"="Opaque" }
  GpuProgramID 154744
Program "vp" {
SubProgram "opengl " {
// Stats: 87 math, 3 textures, 9 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLSL
#ifdef VERTEX
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  vec4 v_2;
  v_2.x = _World2Object[0].x;
  v_2.y = _World2Object[1].x;
  v_2.z = _World2Object[2].x;
  v_2.w = _World2Object[3].x;
  vec4 v_3;
  v_3.x = _World2Object[0].y;
  v_3.y = _World2Object[1].y;
  v_3.z = _World2Object[2].y;
  v_3.w = _World2Object[3].y;
  vec4 v_4;
  v_4.x = _World2Object[0].z;
  v_4.y = _World2Object[1].z;
  v_4.z = _World2Object[2].z;
  v_4.w = _World2Object[3].z;
  vec3 tmpvar_5;
  tmpvar_5 = normalize(((
    (v_2.xyz * gl_Normal.x)
   + 
    (v_3.xyz * gl_Normal.y)
  ) + (v_4.xyz * gl_Normal.z)));
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  vec3 x2_6;
  vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5.xyzz * tmpvar_5.yzzx);
  x2_6.x = dot (unity_SHBr, tmpvar_7);
  x2_6.y = dot (unity_SHBg, tmpvar_7);
  x2_6.z = dot (unity_SHBb, tmpvar_7);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_5;
  xlv_TEXCOORD2 = (_Object2World * gl_Vertex).xyz;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (x2_6 + (unity_SHC.xyz * (
    (tmpvar_5.x * tmpvar_5.x)
   - 
    (tmpvar_5.y * tmpvar_5.y)
  )));
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec4 outDiffuse_1;
  vec4 outEmission_2;
  vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  vec3 tmpvar_5;
  vec3 tmpvar_6;
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = xlv_TEXCOORD1;
  vec3 x1_8;
  x1_8.x = dot (unity_SHAr, tmpvar_7);
  x1_8.y = dot (unity_SHAg, tmpvar_7);
  x1_8.z = dot (unity_SHAb, tmpvar_7);
  tmpvar_5 = (xlv_TEXCOORD5 + x1_8);
  vec3 tmpvar_9;
  vec3 I_10;
  I_10 = -(tmpvar_3);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (xlv_TEXCOORD1, I_10)
   * xlv_TEXCOORD1)));
  vec3 worldNormal_11;
  worldNormal_11 = tmpvar_9;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_12;
    tmpvar_12 = normalize(tmpvar_9);
    vec3 tmpvar_13;
    tmpvar_13 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD2) / tmpvar_12);
    vec3 tmpvar_14;
    tmpvar_14 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD2) / tmpvar_12);
    bvec3 tmpvar_15;
    tmpvar_15 = greaterThan (tmpvar_12, vec3(0.0, 0.0, 0.0));
    float tmpvar_16;
    if (tmpvar_15.x) {
      tmpvar_16 = tmpvar_13.x;
    } else {
      tmpvar_16 = tmpvar_14.x;
    };
    float tmpvar_17;
    if (tmpvar_15.y) {
      tmpvar_17 = tmpvar_13.y;
    } else {
      tmpvar_17 = tmpvar_14.y;
    };
    float tmpvar_18;
    if (tmpvar_15.z) {
      tmpvar_18 = tmpvar_13.z;
    } else {
      tmpvar_18 = tmpvar_14.z;
    };
    vec3 tmpvar_19;
    tmpvar_19 = ((unity_SpecCube0_BoxMax.xyz + unity_SpecCube0_BoxMin.xyz) * 0.5);
    worldNormal_11 = (((
      (tmpvar_19 - unity_SpecCube0_ProbePosition.xyz)
     + xlv_TEXCOORD2) + (tmpvar_12 * 
      min (min (tmpvar_16, tmpvar_17), tmpvar_18)
    )) - tmpvar_19);
  };
  vec4 tmpvar_20;
  tmpvar_20.xyz = worldNormal_11;
  tmpvar_20.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
  vec4 tmpvar_21;
  tmpvar_21 = textureCubeLod (unity_SpecCube0, worldNormal_11, tmpvar_20.w);
  vec3 tmpvar_22;
  tmpvar_22 = ((unity_SpecCube0_HDR.x * pow (tmpvar_21.w, unity_SpecCube0_HDR.y)) * tmpvar_21.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldNormal_23;
    worldNormal_23 = tmpvar_9;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_24;
      tmpvar_24 = normalize(tmpvar_9);
      vec3 tmpvar_25;
      tmpvar_25 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD2) / tmpvar_24);
      vec3 tmpvar_26;
      tmpvar_26 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD2) / tmpvar_24);
      bvec3 tmpvar_27;
      tmpvar_27 = greaterThan (tmpvar_24, vec3(0.0, 0.0, 0.0));
      float tmpvar_28;
      if (tmpvar_27.x) {
        tmpvar_28 = tmpvar_25.x;
      } else {
        tmpvar_28 = tmpvar_26.x;
      };
      float tmpvar_29;
      if (tmpvar_27.y) {
        tmpvar_29 = tmpvar_25.y;
      } else {
        tmpvar_29 = tmpvar_26.y;
      };
      float tmpvar_30;
      if (tmpvar_27.z) {
        tmpvar_30 = tmpvar_25.z;
      } else {
        tmpvar_30 = tmpvar_26.z;
      };
      vec3 tmpvar_31;
      tmpvar_31 = ((unity_SpecCube1_BoxMax.xyz + unity_SpecCube1_BoxMin.xyz) * 0.5);
      worldNormal_23 = (((
        (tmpvar_31 - unity_SpecCube1_ProbePosition.xyz)
       + xlv_TEXCOORD2) + (tmpvar_24 * 
        min (min (tmpvar_28, tmpvar_29), tmpvar_30)
      )) - tmpvar_31);
    };
    vec4 tmpvar_32;
    tmpvar_32.xyz = worldNormal_23;
    tmpvar_32.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
    vec4 tmpvar_33;
    tmpvar_33 = textureCubeLod (unity_SpecCube1, worldNormal_23, tmpvar_32.w);
    tmpvar_6 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_33.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_33.xyz), tmpvar_22, unity_SpecCube0_BoxMin.www);
  } else {
    tmpvar_6 = tmpvar_22;
  };
  vec4 c_34;
  vec3 tmpvar_35;
  vec3 tmpvar_36;
  tmpvar_36 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_4.xyz, vec3(_Metallic));
  float tmpvar_37;
  tmpvar_37 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_35 = (tmpvar_4.xyz * tmpvar_37);
  float x_38;
  x_38 = (1.0 - max (0.0, dot (xlv_TEXCOORD1, tmpvar_3)));
  vec3 tmpvar_39;
  tmpvar_39 = ((tmpvar_35 * tmpvar_5) + (tmpvar_6 * mix (tmpvar_36, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_37)), 0.0, 1.0)
  ), vec3(
    ((((x_38 * x_38) * x_38) * x_38) * x_38)
  ))));
  vec4 tmpvar_40;
  tmpvar_40.w = 1.0;
  tmpvar_40.xyz = tmpvar_39;
  c_34.w = tmpvar_40.w;
  c_34.xyz = tmpvar_39;
  vec4 tmpvar_41;
  tmpvar_41.xyz = tmpvar_35;
  tmpvar_41.w = 1.0;
  vec4 tmpvar_42;
  tmpvar_42.xyz = tmpvar_36;
  tmpvar_42.w = _Glossiness;
  vec4 tmpvar_43;
  tmpvar_43.w = 1.0;
  tmpvar_43.xyz = ((xlv_TEXCOORD1 * 0.5) + 0.5);
  vec4 tmpvar_44;
  tmpvar_44.w = 1.0;
  tmpvar_44.xyz = c_34.xyz;
  outDiffuse_1.xyz = tmpvar_41.xyz;
  outEmission_2.w = tmpvar_44.w;
  outDiffuse_1.w = 1.0;
  outEmission_2.xyz = exp2(-(tmpvar_39));
  gl_FragData[0] = outDiffuse_1;
  gl_FragData[1] = tmpvar_42;
  gl_FragData[2] = tmpvar_43;
  gl_FragData[3] = outEmission_2;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 85 math, 3 textures, 9 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"!!GLSL
#ifdef VERTEX
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  vec4 v_2;
  v_2.x = _World2Object[0].x;
  v_2.y = _World2Object[1].x;
  v_2.z = _World2Object[2].x;
  v_2.w = _World2Object[3].x;
  vec4 v_3;
  v_3.x = _World2Object[0].y;
  v_3.y = _World2Object[1].y;
  v_3.z = _World2Object[2].y;
  v_3.w = _World2Object[3].y;
  vec4 v_4;
  v_4.x = _World2Object[0].z;
  v_4.y = _World2Object[1].z;
  v_4.z = _World2Object[2].z;
  v_4.w = _World2Object[3].z;
  vec3 tmpvar_5;
  tmpvar_5 = normalize(((
    (v_2.xyz * gl_Normal.x)
   + 
    (v_3.xyz * gl_Normal.y)
  ) + (v_4.xyz * gl_Normal.z)));
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  vec3 x2_6;
  vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5.xyzz * tmpvar_5.yzzx);
  x2_6.x = dot (unity_SHBr, tmpvar_7);
  x2_6.y = dot (unity_SHBg, tmpvar_7);
  x2_6.z = dot (unity_SHBb, tmpvar_7);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_5;
  xlv_TEXCOORD2 = (_Object2World * gl_Vertex).xyz;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (x2_6 + (unity_SHC.xyz * (
    (tmpvar_5.x * tmpvar_5.x)
   - 
    (tmpvar_5.y * tmpvar_5.y)
  )));
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform sampler2D _MainTex;
uniform float _Glossiness;
uniform float _Metallic;
uniform vec4 _Color;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec4 outDiffuse_1;
  vec3 tmpvar_2;
  tmpvar_2 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  vec4 tmpvar_3;
  tmpvar_3 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  vec3 tmpvar_4;
  vec3 tmpvar_5;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = xlv_TEXCOORD1;
  vec3 x1_7;
  x1_7.x = dot (unity_SHAr, tmpvar_6);
  x1_7.y = dot (unity_SHAg, tmpvar_6);
  x1_7.z = dot (unity_SHAb, tmpvar_6);
  tmpvar_4 = (xlv_TEXCOORD5 + x1_7);
  vec3 tmpvar_8;
  vec3 I_9;
  I_9 = -(tmpvar_2);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (xlv_TEXCOORD1, I_9)
   * xlv_TEXCOORD1)));
  vec3 worldNormal_10;
  worldNormal_10 = tmpvar_8;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_11;
    tmpvar_11 = normalize(tmpvar_8);
    vec3 tmpvar_12;
    tmpvar_12 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD2) / tmpvar_11);
    vec3 tmpvar_13;
    tmpvar_13 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD2) / tmpvar_11);
    bvec3 tmpvar_14;
    tmpvar_14 = greaterThan (tmpvar_11, vec3(0.0, 0.0, 0.0));
    float tmpvar_15;
    if (tmpvar_14.x) {
      tmpvar_15 = tmpvar_12.x;
    } else {
      tmpvar_15 = tmpvar_13.x;
    };
    float tmpvar_16;
    if (tmpvar_14.y) {
      tmpvar_16 = tmpvar_12.y;
    } else {
      tmpvar_16 = tmpvar_13.y;
    };
    float tmpvar_17;
    if (tmpvar_14.z) {
      tmpvar_17 = tmpvar_12.z;
    } else {
      tmpvar_17 = tmpvar_13.z;
    };
    vec3 tmpvar_18;
    tmpvar_18 = ((unity_SpecCube0_BoxMax.xyz + unity_SpecCube0_BoxMin.xyz) * 0.5);
    worldNormal_10 = (((
      (tmpvar_18 - unity_SpecCube0_ProbePosition.xyz)
     + xlv_TEXCOORD2) + (tmpvar_11 * 
      min (min (tmpvar_15, tmpvar_16), tmpvar_17)
    )) - tmpvar_18);
  };
  vec4 tmpvar_19;
  tmpvar_19.xyz = worldNormal_10;
  tmpvar_19.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
  vec4 tmpvar_20;
  tmpvar_20 = textureCubeLod (unity_SpecCube0, worldNormal_10, tmpvar_19.w);
  vec3 tmpvar_21;
  tmpvar_21 = ((unity_SpecCube0_HDR.x * pow (tmpvar_20.w, unity_SpecCube0_HDR.y)) * tmpvar_20.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldNormal_22;
    worldNormal_22 = tmpvar_8;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_23;
      tmpvar_23 = normalize(tmpvar_8);
      vec3 tmpvar_24;
      tmpvar_24 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD2) / tmpvar_23);
      vec3 tmpvar_25;
      tmpvar_25 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD2) / tmpvar_23);
      bvec3 tmpvar_26;
      tmpvar_26 = greaterThan (tmpvar_23, vec3(0.0, 0.0, 0.0));
      float tmpvar_27;
      if (tmpvar_26.x) {
        tmpvar_27 = tmpvar_24.x;
      } else {
        tmpvar_27 = tmpvar_25.x;
      };
      float tmpvar_28;
      if (tmpvar_26.y) {
        tmpvar_28 = tmpvar_24.y;
      } else {
        tmpvar_28 = tmpvar_25.y;
      };
      float tmpvar_29;
      if (tmpvar_26.z) {
        tmpvar_29 = tmpvar_24.z;
      } else {
        tmpvar_29 = tmpvar_25.z;
      };
      vec3 tmpvar_30;
      tmpvar_30 = ((unity_SpecCube1_BoxMax.xyz + unity_SpecCube1_BoxMin.xyz) * 0.5);
      worldNormal_22 = (((
        (tmpvar_30 - unity_SpecCube1_ProbePosition.xyz)
       + xlv_TEXCOORD2) + (tmpvar_23 * 
        min (min (tmpvar_27, tmpvar_28), tmpvar_29)
      )) - tmpvar_30);
    };
    vec4 tmpvar_31;
    tmpvar_31.xyz = worldNormal_22;
    tmpvar_31.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
    vec4 tmpvar_32;
    tmpvar_32 = textureCubeLod (unity_SpecCube1, worldNormal_22, tmpvar_31.w);
    tmpvar_5 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_32.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_32.xyz), tmpvar_21, unity_SpecCube0_BoxMin.www);
  } else {
    tmpvar_5 = tmpvar_21;
  };
  vec4 c_33;
  vec3 tmpvar_34;
  vec3 tmpvar_35;
  tmpvar_35 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_3.xyz, vec3(_Metallic));
  float tmpvar_36;
  tmpvar_36 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_34 = (tmpvar_3.xyz * tmpvar_36);
  float x_37;
  x_37 = (1.0 - max (0.0, dot (xlv_TEXCOORD1, tmpvar_2)));
  vec3 tmpvar_38;
  tmpvar_38 = ((tmpvar_34 * tmpvar_4) + (tmpvar_5 * mix (tmpvar_35, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_36)), 0.0, 1.0)
  ), vec3(
    ((((x_37 * x_37) * x_37) * x_37) * x_37)
  ))));
  vec4 tmpvar_39;
  tmpvar_39.w = 1.0;
  tmpvar_39.xyz = tmpvar_38;
  c_33.w = tmpvar_39.w;
  c_33.xyz = tmpvar_38;
  vec4 tmpvar_40;
  tmpvar_40.xyz = tmpvar_34;
  tmpvar_40.w = 1.0;
  vec4 tmpvar_41;
  tmpvar_41.xyz = tmpvar_35;
  tmpvar_41.w = _Glossiness;
  vec4 tmpvar_42;
  tmpvar_42.w = 1.0;
  tmpvar_42.xyz = ((xlv_TEXCOORD1 * 0.5) + 0.5);
  vec4 tmpvar_43;
  tmpvar_43.w = 1.0;
  tmpvar_43.xyz = c_33.xyz;
  outDiffuse_1.xyz = tmpvar_40.xyz;
  outDiffuse_1.w = 1.0;
  gl_FragData[0] = outDiffuse_1;
  gl_FragData[1] = tmpvar_41;
  gl_FragData[2] = tmpvar_42;
  gl_FragData[3] = tmpvar_43;
}


#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"!!GLSL"
}
}
 }
}
Fallback "Diffuse"
}