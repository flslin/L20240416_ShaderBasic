// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "NoiseShader"
{
	Properties
	{
		_ccc("ccc", 2D) = "white" {}
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		_UVDistortionIntence("UVDistortionIntence", Range( 0.1 , 10)) = 10
		_c("c", 2D) = "white" {}
		_MoveX("MoveX", Range( -2 , 2)) = 0
		_MoveY("MoveY", Range( -2 , 2)) = 0
		_ScaleU("ScaleU", Range( 1 , 10)) = 1
		_ScaleV("ScaleV", Range( 1 , 10)) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IsEmissive" = "true"  }
		Cull Back
		ZWrite Off
		Blend One One
		
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha noshadow 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _c;
		uniform float _ScaleU;
		uniform float _ScaleV;
		uniform float _MoveX;
		uniform float _MoveY;
		uniform sampler2D _ccc;
		uniform sampler2D _TextureSample0;
		uniform float _UVDistortionIntence;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 appendResult21 = (float2(_ScaleU , _ScaleV));
			float2 appendResult17 = (float2(_MoveX , _MoveY));
			float2 panner2 = ( 1.0 * _Time.y * float2( 0.1,0.2 ) + i.uv_texcoord);
			float4 tex2DNode1 = tex2D( _ccc, panner2 );
			float cos6 = cos( -0.4 * _Time.y );
			float sin6 = sin( -0.4 * _Time.y );
			float2 rotator6 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos6 , -sin6 , sin6 , cos6 )) + float2( 0.5,0.5 );
			float4 tex2DNode4 = tex2D( _TextureSample0, rotator6 );
			o.Emission = tex2D( _c, ( ( ( i.uv_texcoord * appendResult21 ) + appendResult17 ) + ( ( ( tex2DNode1.r * tex2DNode4.g ) * ( tex2DNode1.g * tex2DNode4.b ) ) * _UVDistortionIntence ) ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16700
0;0;1920;1019;1762.572;608.1687;1.743799;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;5;-1066,649.5;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;3;-1072,357.5;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;2;-836,358.5;Float;True;3;0;FLOAT2;0,0;False;2;FLOAT2;0.1,0.2;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;6;-841,650.5;Float;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;-0.4;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;4;-587,622.5;Float;True;Property;_TextureSample0;Texture Sample 0;2;0;Create;True;0;0;False;0;046500e4c578fc34fa93233f58e229d3;046500e4c578fc34fa93233f58e229d3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-593,330.5;Float;True;Property;_ccc;ccc;1;0;Create;True;0;0;False;0;046500e4c578fc34fa93233f58e229d3;046500e4c578fc34fa93233f58e229d3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;22;-620.3839,-425.0694;Float;False;Property;_ScaleU;ScaleU;7;0;Create;True;0;0;False;0;1;0;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;23;-618.6401,-166.9873;Float;False;Property;_ScaleV;ScaleV;8;0;Create;True;0;0;False;0;1;0;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;13;-255.6671,-433.3247;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;18;-304.7673,120.3857;Float;False;Property;_MoveX;MoveX;5;0;Create;True;0;0;False;0;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;19;-308.2956,214.2689;Float;False;Property;_MoveY;MoveY;6;0;Create;True;0;0;False;0;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;21;-248.9551,-154.7811;Float;True;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-246,602.5;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;-247,332.5;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;17;42.62708,164.7572;Float;True;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-15,724.5;Float;True;Property;_UVDistortionIntence;UVDistortionIntence;3;0;Create;True;0;0;False;0;10;0;0.1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;49,490.5;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;91.08587,-280.3345;Float;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;362,578.5;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;16;376.3945,-54.02381;Float;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;14;641.0498,256.657;Float;True;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;15;885.2813,227.6569;Float;True;Property;_c;c;4;0;Create;True;0;0;False;0;6779dd3b17badc743ae97d117caaa890;6779dd3b17badc743ae97d117caaa890;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1309,381;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;NoiseShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;2;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;True;Transparent;;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;4;1;False;-1;1;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2;0;3;0
WireConnection;6;0;5;0
WireConnection;4;1;6;0
WireConnection;1;1;2;0
WireConnection;21;0;22;0
WireConnection;21;1;23;0
WireConnection;8;0;1;2
WireConnection;8;1;4;3
WireConnection;7;0;1;1
WireConnection;7;1;4;2
WireConnection;17;0;18;0
WireConnection;17;1;19;0
WireConnection;9;0;7;0
WireConnection;9;1;8;0
WireConnection;20;0;13;0
WireConnection;20;1;21;0
WireConnection;12;0;9;0
WireConnection;12;1;11;0
WireConnection;16;0;20;0
WireConnection;16;1;17;0
WireConnection;14;0;16;0
WireConnection;14;1;12;0
WireConnection;15;1;14;0
WireConnection;0;2;15;0
ASEEND*/
//CHKSM=99323830BE40427F42EDF8D587E6A1290E96AB65