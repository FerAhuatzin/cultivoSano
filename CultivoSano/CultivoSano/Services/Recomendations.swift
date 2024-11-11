//
//  Recomendations.swift
//  Cultivos_Sano
//
//  Created by iOS Lab on 10/11/24.
//

import Foundation

struct Recomendacion {
    let descripcionEnfermedad: String
    let descripcion: String
    let recomendacion: String
    let recomendacionEcologica: String
}

// Diccionario con las reglas específicas para cada combinación
let reglas: [String: [(temperaturaRange: ClosedRange<Double>, humedadRange: ClosedRange<Double>, recomendacion: Recomendacion)]] = [
    "Wheat_Yellow_Rust": [
        (temperaturaRange: 15...Double.greatestFiniteMagnitude, humedadRange: 70...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Roya amarilla en trigo",
            descripcion: "Enfermedad fúngica que causa pústulas amarillas en las hojas, afectando la fotosíntesis y el crecimiento.",
            recomendacion: "Aplicar tratamientos tempranos con insecticidas para controlar áfidos y reducir riego excesivo.",
            recomendacionEcologica: "Rotación de cultivos y uso de variedades resistentes para disminuir incidencia."))
    ],
    "Wheat_Yellow_Rust_Cool": [
        (temperaturaRange: 10...20, humedadRange: -10000...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Roya amarilla en clima frío",
            descripcion: "Variante de roya amarilla que prospera en climas frescos, causando pústulas en las hojas.",
            recomendacion: "Plantar variedades resistentes, usar fungicidas según sea necesario y monitorear condiciones frías.",
            recomendacionEcologica: "Mantener un control de humedad adecuado y fomentar el uso de variedades tolerantes."))
    ],
    "Wheat_Black_Rust": [
        (temperaturaRange: 20...30, humedadRange: 70...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Roya negra en trigo",
            descripcion: "Causada por el hongo Puccinia graminis, produce pústulas oscuras en hojas y tallos.",
            recomendacion: "Aplicar fungicidas en condiciones favorables y utilizar variedades resistentes.",
            recomendacionEcologica: "Rotación de cultivos y manejo adecuado del suelo para mejorar resistencia."))
    ],
    "Wheat_Blast": [
        (temperaturaRange: 25...Double.greatestFiniteMagnitude, humedadRange: 70...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Tizón en trigo",
            descripcion: "Enfermedad causada por Magnaporthe oryzae, afecta la espiga y produce lesiones marrones.",
            recomendacion: "Evitar plantaciones tardías y aplicar fungicidas en condiciones favorables.",
            recomendacionEcologica: "Rotación con cultivos no hospedantes y uso de biofungicidas."))
    ],
    "Wheat_Brown_Rust": [
        (temperaturaRange: 15...22, humedadRange: 70...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Roya marrón en trigo",
            descripcion: "Aparece en condiciones de humedad alta, formando pústulas marrones en las hojas.",
            recomendacion: "Evitar plantaciones tardías y aplicar fungicidas en condiciones favorables.",
            recomendacionEcologica: "Implementar cultivos de cobertura que supriman patógenos y aumenten biodiversidad."))
    ],
    "Wheat_Common_Root_Rot": [
        (temperaturaRange: 15...22, humedadRange: -1000...60, recomendacion: Recomendacion(
            descripcionEnfermedad: "Pudrición común de la raíz en trigo",
            descripcion: "Enfermedad causada por hongos del suelo que afecta las raíces, provocando un crecimiento atrofiado.",
            recomendacion: "Rotación de cultivos, buen drenaje y evitar estrés hídrico.",
            recomendacionEcologica: "Compostaje y prácticas de laboreo mínimo para mantener el equilibrio microbiano."))
    ],
    "Wheat_Fusarium_Head_Blight": [
        (temperaturaRange: 25...30, humedadRange: 60...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Fusariosis de la espiga en trigo",
            descripcion: "Infección fúngica que causa espigas decoloradas y granos podridos.",
            recomendacion: "Aplicar fungicidas en floración y usar variedades resistentes.",
            recomendacionEcologica: "Manejo de residuos de cultivos y uso de control biológico de hongos."))
    ],
    "Wheat_Healthy": [
        (temperaturaRange: -1000...Double.greatestFiniteMagnitude, humedadRange: -10000...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Trigo saludable",
            descripcion: "Estado del trigo con bajo riesgo de enfermedades, con condiciones ambientales balanceadas.",
            recomendacion: "Monitorear condiciones ambientales para evitar exceso de humedad.",
            recomendacionEcologica: "Aplicar riego controlado y mejorar estructura del suelo con abono orgánico."))
    ],
    "Wheat_Leaf_Blight": [
        (temperaturaRange: 25...30, humedadRange: 60...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Tizón de la hoja en trigo",
            descripcion: "Enfermedad que causa manchas marrones en las hojas, afectando la fotosíntesis.",
            recomendacion: "Aplicar fungicidas temprano y rotar cultivos.",
            recomendacionEcologica: "Controlar fertilizantes nitrogenados y usar biofungicidas."))
    ],
    "Wheat_Mildew": [
        (temperaturaRange: 15...20, humedadRange: 60...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Mildiu en trigo",
            descripcion: "Infección fúngica que produce moho blanco en las hojas, reduciendo el vigor de la planta.",
            recomendacion: "Aplicar fungicidas y usar cultivares resistentes.",
            recomendacionEcologica: "Fomentar la circulación del aire y aplicar biofertilizantes."))
    ],
    "Wheat_Mite": [
        (temperaturaRange: 25...30, humedadRange: -10000...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Ácaro en trigo",
            descripcion: "Infestación de ácaros que debilita la planta y reduce la producción.",
            recomendacion: "Control de poblaciones de ácaros mediante prácticas de riego.",
            recomendacionEcologica: "Usar aceites vegetales o extractos naturales para control ecológico."))
    ],
    "Wheat_Septoria": [
        (temperaturaRange: 15...20, humedadRange: 60...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Septoria en trigo",
            descripcion: "Causa manchas marrones y afecta la fotosíntesis.",
            recomendacion: "Tratamientos con fungicidas en clima húmedo.",
            recomendacionEcologica: "Poda selectiva y manejo para mejorar ventilación."))
    ],
    "Wheat_Smut": [
        (temperaturaRange: -1000...Double.greatestFiniteMagnitude, humedadRange: 60...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Carbón en trigo",
            descripcion: "Infección de hongo que transforma las semillas en esporas negras.",
            recomendacion: "Tratamiento de semillas para reducir riesgo de infección.",
            recomendacionEcologica: "Usar variedades resistentes y aplicar bioinoculantes."))
    ],
    "Wheat_Stem_Fly": [
        (temperaturaRange: 20...Double.greatestFiniteMagnitude, humedadRange: -10000...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Mosca del tallo en trigo",
            descripcion: "Plaga de insecto cuyas larvas se alimentan dentro del tallo, debilitando la estructura.",
            recomendacion: "Rotación de cultivos y ajuste en época de siembra.",
            recomendacionEcologica: "Control biológico con depredadores naturales."))
    ],
    "Wheat_Tan_Spot": [
        (temperaturaRange: 15...25, humedadRange: -10000...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Mancha bronceada en trigo",
            descripcion: "Enfermedad fúngica que causa manchas marrones en las hojas.",
            recomendacion: "Evitar el cultivo continuo de trigo y usar variedades resistentes.",
            recomendacionEcologica: "Aplicar microorganismos benéficos y diversificar cultivos."))
    ],
    
    // Enfermedades de Bean (Frijol)
    "Bean_Anthracnose": [
        (temperaturaRange: 13...26, humedadRange: 92...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Antracnosis en frijol",
            descripcion: "Infección fúngica causada por Colletotrichum lindemuthianum, que produce lesiones oscuras en hojas, tallos y vainas.",
            recomendacion: "Usa semillas certificadas libres de la enfermedad y practica la rotación de cultivos.",
            recomendacionEcologica: "Rotación de cultivos y uso de semillas certificadas para prevenir la propagación."))
    ],
    "Bean_Rust": [
        (temperaturaRange: 18...25, humedadRange: 85...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Roya en frijol",
            descripcion: "Enfermedad causada por el hongo Uromyces appendiculatus, que forma pústulas anaranjadas en la superficie de las hojas.",
            recomendacion: "Practica la rotación de cultivos y elige variedades de frijol resistentes a la enfermedad.",
            recomendacionEcologica: "Rotación de cultivos y evitar el riego por aspersión para reducir la humedad en las hojas."))
    ],
    "Bean_Healthy": [
        (temperaturaRange: -1000...Double.greatestFiniteMagnitude, humedadRange: -10000...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Frijol saludable",
            descripcion: "Estado saludable del frijol con bajo riesgo de enfermedades.",
            recomendacion: "Controla la humedad del suelo para evitar el exceso de humedad o el estrés hídrico.",
            recomendacionEcologica: "Buena ventilación y drenaje ayudan a reducir vulnerabilidad a enfermedades."))
    ],
    "Pumpkin_Healthy": [
        (temperaturaRange: -1000...Double.greatestFiniteMagnitude, humedadRange: -10000...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Calabaza saludable",
            descripcion: "Calabaza en condiciones óptimas de salud con baja incidencia de enfermedades.",
            recomendacion: "Mantener un control adecuado de humedad y buena circulación de aire.",
            recomendacionEcologica: "Uso de variedades resistentes y prácticas de manejo sostenible."))
    ],
    
    // Enfermedades de Pumpkin (Calabaza)
    "Pumpkin_Bacterial_Leaf_Spot": [
        (temperaturaRange: 24...30, humedadRange: 80...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Mancha bacteriana en hojas de calabaza",
            descripcion: "Enfermedad bacteriana causada por Xanthomonas campestris, que provoca manchas en las hojas.",
            recomendacion: "Evitar el riego por aspersión y asegurar buena circulación de aire.",
            recomendacionEcologica: "Evitar el riego por aspersión y promover buena ventilación para reducir la humedad."))
    ],
    "Pumpkin_Downey_Mildew": [
        (temperaturaRange: 18...25, humedadRange: 70...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Mildiu velloso en calabaza",
            descripcion: "Infección fúngica causada por Pseudoperonospora cubensis, que afecta hojas y tallos.",
            recomendacion: "Aplicar fungicidas preventivos en condiciones húmedas y cálidas.",
            recomendacionEcologica: "Aplicar control biológico mediante fungicidas naturales y eliminar hojas infectadas."))
    ],
    "Pumpkin_Leaf_Curl_Disease": [
        (temperaturaRange: 25...Double.greatestFiniteMagnitude, humedadRange: 70...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Enfermedad de enrollamiento de hojas en calabaza",
            descripcion: "Enfermedad viral transmitida por insectos, que causa deformaciones en las hojas y reduce el crecimiento.",
            recomendacion: "Controlar la humedad excesiva y usar variedades resistentes al virus.",
            recomendacionEcologica: "Control biológico de vectores (como áfidos) y uso de cultivos de cobertura."))
    ],
    "Pumpkin_Mosaic_Disease": [
        (temperaturaRange: 15...25, humedadRange: -10000...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Enfermedad del mosaico en calabaza",
            descripcion: "Causada por virus transmitidos por áfidos, provoca manchas y deformaciones en las hojas.",
            recomendacion: "Evitar infestación de áfidos, control de plagas y eliminación de plantas infectadas.",
            recomendacionEcologica: "Usar semillas libres de virus y mantener control de plagas para prevenir la transmisión."))
    ],
    "Pumpkin_Powdery_Mildew": [
        (temperaturaRange: 18...24, humedadRange: 60...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Mildiu polvoriento en calabaza",
            descripcion: "Infección causada por hongos como Erysiphe cichoracearum, que forma un moho blanco en las hojas.",
            recomendacion: "Aplicar fungicidas específicos y proporcionar buena ventilación.",
            recomendacionEcologica: "Aplicar biofungicidas y mejorar la ventilación para reducir la humedad en las plantas."))
    ],
    "Pumpkin_Red_Beetle": [
        (temperaturaRange: 20...Double.greatestFiniteMagnitude, humedadRange: 50...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Escarabajo rojo en calabaza",
            descripcion: "Insecto plaga que se alimenta de las hojas, causando daños extensivos.",
            recomendacion: "Aplicación de insecticidas y monitoreo constante de los cultivos.",
            recomendacionEcologica: "Monitoreo constante y uso de trampas para capturar escarabajos."))
    ]
]

// Recomendaciones genéricas por especie
let recomendacionesGenericas: [String: Recomendacion] = [
    "Wheat": Recomendacion(
        descripcionEnfermedad: "Enfermedad en trigo",
        descripcion: "Trigo afectado por condiciones subóptimas o presencia de enfermedades.",
        recomendacion: "Monitorear las condiciones ambientales para mantener un equilibrio de humedad que evite el estrés por sequía y la susceptibilidad a enfermedades.",
        recomendacionEcologica: "Optimizar el riego y la ventilación para prevenir enfermedades, y usar variedades resistentes."
    ),
    "Bean": Recomendacion(
        descripcionEnfermedad: "Enfermedad en frijol",
        descripcion: "Frijol afectado por patógenos o condiciones ambientales desfavorables.",
        recomendacion: "Utilizar semillas certificadas y practicar la rotación de cultivos para reducir la acumulación de patógenos.",
        recomendacionEcologica: "Evitar el riego por aspersión y asegurar una buena ventilación para reducir la humedad en el follaje."
    ),
    "Pumpkin": Recomendacion(
        descripcionEnfermedad: "Enfermedad en calabaza",
        descripcion: "Calabaza con signos de enfermedad o en condiciones de humedad elevada.",
        recomendacion: "Asegurar un buen drenaje y evitar el riego por aspersión para minimizar la acumulación de humedad en las hojas.",
        recomendacionEcologica: "Promover buena circulación de aire y usar variedades resistentes para mejorar la salud general del cultivo."
    )
]


func obtenerRecomendacion(especie: String, enfermedad: String, temperatura: Double, humedad: Double) -> [String: String] {
    // Buscar recomendaciones específicas en el árbol
    if let reglasPorEnfermedad = reglas[enfermedad] {
        for regla in reglasPorEnfermedad {
            if regla.temperaturaRange.contains(temperatura) && regla.humedadRange.contains(humedad) {
                return [
                    "descripcion_enfermedad": regla.recomendacion.descripcionEnfermedad,
                    "descrpicon": regla.recomendacion.descripcion,
                    "recomendacion": regla.recomendacion.recomendacion,
                    "recomendacion_ecologica": regla.recomendacion.recomendacionEcologica
                ]
            }
        }
    }
    
    // Si no hay una recomendación específica, regresar una recomendación genérica para la especie
    if let recomendacionGenerica = recomendacionesGenericas[especie] {
        return [
            "descripcion_enfermedad": recomendacionGenerica.descripcionEnfermedad,
            "descripcion": recomendacionGenerica.descripcion,
            "recomendacion": recomendacionGenerica.recomendacion,
            "recomendacion_ecologica": recomendacionGenerica.recomendacionEcologica
        ]
    }
    
    // Si no hay recomendaciones ni específicas ni genéricas, regresar un valor vacío
    return [
        "descripcion_enfermedad": "Sin descripción disponible",
        "descripcion": "No se encontraro descrpiciones de la enfermedad",
        "recomendacion": "No se encontraron recomendaciones específicas.",
        "recomendacion_ecologica": "Mantener buenas prácticas de cultivo."
    ]
}
