// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Light"
{
	Properties
	{
		_a("a", 2D) = "white" {}
		_TextureSample1("Texture Sample 1", 2D) = "white" {}
		_Clouds("Clouds", 2D) = "white" {}
		_fff("fff", 2D) = "white" {}
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		_Final_Intence("Final_Intence", Range( 0 , 10)) = 10
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
		#pragma surface surf Unlit keepalpha 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _fff;
		uniform sampler2D _TextureSample0;
		uniform sampler2D _Clouds;
		uniform sampler2D _a;
		uniform sampler2D _TextureSample1;
		uniform float _Final_Intence;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 panner5 = ( 1.0 * _Time.y * float2( 0.1,0 ) + i.uv_texcoord);
			float2 panner8 = ( 1.0 * _Time.y * float2( -0.15,0.1 ) + i.uv_texcoord);
			float2 panner10 = ( 1.0 * _Time.y * float2( -0.1,0.05 ) + i.uv_texcoord);
			float2 panner13 = ( 1.0 * _Time.y * float2( -0.01,0 ) + i.uv_texcoord);
			float2 panner16 = ( 1.0 * _Time.y * float2( 0.012,0 ) + i.uv_texcoord);
			o.Emission = ( ( tex2D( _fff, panner5 ).r * tex2D( _TextureSample0, panner8 ).g * tex2D( _Clouds, panner10 ).r ) * ( tex2D( _a, panner13 ) * tex2D( _TextureSample1, panner16 ) ) * _Final_Intence ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16700
0;0;1920;1019;1253.511;187.9915;1.536981;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;6;-534.8489,197.6302;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;11;-534.5243,-70.65549;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;7;-531.6639,480.2536;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;15;-532.4697,1018.652;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;12;-531.6638,752.1268;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;16;-253.158,986.7454;Float;True;3;0;FLOAT2;0,0;False;2;FLOAT2;0.012,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;13;-250.8151,752.4967;Float;True;3;0;FLOAT2;0,0;False;2;FLOAT2;-0.01,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;5;-254,198;Float;True;3;0;FLOAT2;0,0;False;2;FLOAT2;0.1,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;8;-250.8151,480.6234;Float;True;3;0;FLOAT2;0,0;False;2;FLOAT2;-0.15,0.1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;10;-258.9769,-70.65556;Float;True;3;0;FLOAT2;0,0;False;2;FLOAT2;-0.1,0.05;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;2;33,-38;Float;True;Property;_Clouds;Clouds;3;0;Create;True;0;0;False;0;1bbd9e4dbb3685248809a89dc58a01fe;1bbd9e4dbb3685248809a89dc58a01fe;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;44.53284,640.7505;Float;True;Property;_a;a;1;0;Create;True;0;0;False;0;3e94aeddf6175824399a04749033bafc;3e94aeddf6175824399a04749033bafc;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;32.52839,406.9487;Float;True;Property;_TextureSample0;Texture Sample 0;5;0;Create;True;0;0;False;0;a1ad534ff6743c64da867f45c3bdbfae;a1ad534ff6743c64da867f45c3bdbfae;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;31,177;Float;True;Property;_fff;fff;4;0;Create;True;0;0;False;0;a1ad534ff6743c64da867f45c3bdbfae;a1ad534ff6743c64da867f45c3bdbfae;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;14;43.72683,907.2758;Float;True;Property;_TextureSample1;Texture Sample 1;2;0;Create;True;0;0;False;0;3e94aeddf6175824399a04749033bafc;3e94aeddf6175824399a04749033bafc;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;427.491,230.5312;Float;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;394.1327,515.9461;Float;True;Property;_Final_Intence;Final_Intence;6;0;Create;True;0;0;False;0;10;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;424.8723,795.676;Float;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;761.4709,568.2029;Float;True;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1202.046,441.8338;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;Light;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;2;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;False;Transparent;;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;4;1;False;-1;1;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;16;0;15;0
WireConnection;13;0;12;0
WireConnection;5;0;6;0
WireConnection;8;0;7;0
WireConnection;10;0;11;0
WireConnection;2;1;10;0
WireConnection;1;1;13;0
WireConnection;4;1;8;0
WireConnection;3;1;5;0
WireConnection;14;1;16;0
WireConnection;9;0;3;1
WireConnection;9;1;4;2
WireConnection;9;2;2;1
WireConnection;17;0;1;0
WireConnection;17;1;14;0
WireConnection;19;0;9;0
WireConnection;19;1;17;0
WireConnection;19;2;20;0
WireConnection;0;2;19;0
ASEEND*/
//CHKSM=613964EACEC14AEEDA1ADA4A093C41D108353837