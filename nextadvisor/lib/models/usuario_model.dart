import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    Usuario({
        this.cuentaId,
        this.cuentaNombreUsuario,
        this.cuentaCorreo,
        this.cuentaTelefono,
        this.cuentaNombre,
        this.cuentaApellidoPaterno,
        this.cuentaApellidoMaterno,
        this.cuentaGenero,
        this.rolId,
        this.createdAt,
        this.updatedAt,
        this.estudianteId,
        this.cuentaIdEstudiante,
        this.estudianteCalificacion,
        this.estudianteCarrera,
        this.estudianteSemestre,
    });

    int cuentaId;
    String cuentaNombreUsuario;
    String cuentaCorreo;
    String cuentaTelefono;
    String cuentaNombre;
    String cuentaApellidoPaterno;
    String cuentaApellidoMaterno;
    String cuentaGenero;
    int rolId;
    DateTime createdAt;
    DateTime updatedAt;
    int estudianteId;
    int cuentaIdEstudiante;
    int estudianteCalificacion;
    String estudianteCarrera;
    int estudianteSemestre;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        cuentaId: json["cuenta_id"],
        cuentaNombreUsuario: json["cuenta_nombre_usuario"],
        cuentaCorreo: json["cuenta_correo"],
        cuentaTelefono: json["cuenta_telefono"],
        cuentaNombre: json["cuenta_nombre"],
        cuentaApellidoPaterno: json["cuenta_apellido_paterno"],
        cuentaApellidoMaterno: json["cuenta_apellido_materno"],
        cuentaGenero: json["cuenta_genero"],
        rolId: json["rol_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        estudianteId: json["estudiante_id"],
        cuentaIdEstudiante: json["cuenta_id_estudiante"],
        estudianteCalificacion: json["estudiante_calificacion"],
        estudianteCarrera: json["estudiante_carrera"],
        estudianteSemestre: json["estudiante_semestre"],
    );

    Map<String, dynamic> toJson() => {
        "cuenta_id": cuentaId,
        "cuenta_nombre_usuario": cuentaNombreUsuario,
        "cuenta_correo": cuentaCorreo,
        "cuenta_telefono": cuentaTelefono,
        "cuenta_nombre": cuentaNombre,
        "cuenta_apellido_paterno": cuentaApellidoPaterno,
        "cuenta_apellido_materno": cuentaApellidoMaterno,
        "cuenta_genero": cuentaGenero,
        "rol_id": rolId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "estudiante_id": estudianteId,
        "cuenta_id_estudiante": cuentaIdEstudiante,
        "estudiante_calificacion": estudianteCalificacion,
        "estudiante_carrera": estudianteCarrera,
        "estudiante_semestre": estudianteSemestre,
    };
}
