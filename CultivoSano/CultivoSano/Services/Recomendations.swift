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
    let climateRecommendation: String
}

// Diccionario con las reglas específicas para cada combinación
let reglas: [String: [(temperaturaRange: ClosedRange<Double>, humedadRange: ClosedRange<Double>, recomendacion: Recomendacion)]] = [
    "Wheat_Yellow_Rust": [
        (temperaturaRange: 15...Double.greatestFiniteMagnitude, humedadRange: 70...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Roya amarilla en trigo",
            descripcion: "Enfermedad fúngica que causa pústulas amarillas en las hojas, afectando la fotosíntesis y el crecimiento.",
            recomendacion: "Aplicar tratamientos tempranos con insecticidas para controlar áfidos y reducir riego excesivo.",
            recomendacionEcologica: "Rotación de cultivos y uso de variedades resistentes para disminuir incidencia.",
            climateRecommendation: "Las condiciones de alta humedad y temperatura favorecen el desarrollo de roya amarilla; es crucial aplicar fungicidas preventivos y monitorear el cultivo.")
        )
    ],
    "Wheat_Yellow_Rust_Cool": [
        (temperaturaRange: 10...20, humedadRange: -10000...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Roya amarilla en clima frío",
            descripcion: "Variante de roya amarilla que prospera en climas frescos, causando pústulas en las hojas.",
            recomendacion: "Plantar variedades resistentes, usar fungicidas según sea necesario y monitorear condiciones frías.",
            recomendacionEcologica: "Mantener un control de humedad adecuado y fomentar el uso de variedades tolerantes.",
            climateRecommendation: "En condiciones frescas, la roya amarilla puede desarrollarse rápidamente; se recomienda monitorear y aplicar control preventivo.")
        )
    ],
    "Wheat_Black_Rust": [
        (temperaturaRange: 20...30, humedadRange: 70...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Roya negra en trigo",
            descripcion: "Causada por el hongo Puccinia graminis, produce pústulas oscuras en hojas y tallos.",
            recomendacion: "Aplicar fungicidas en condiciones favorables y utilizar variedades resistentes.",
            recomendacionEcologica: "Rotación de cultivos y manejo adecuado del suelo para mejorar resistencia.",
            climateRecommendation: "El clima cálido y húmedo aumenta la propagación de roya negra; refuerce la aplicación de fungicidas.")
        )
    ],
    "Wheat_Blast": [
        (temperaturaRange: 25...Double.greatestFiniteMagnitude, humedadRange: 70...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Tizón en trigo",
            descripcion: "Enfermedad causada por Magnaporthe oryzae, afecta la espiga y produce lesiones marrones.",
            recomendacion: "Evitar plantaciones tardías y aplicar fungicidas en condiciones favorables.",
            recomendacionEcologica: "Rotación con cultivos no hospedantes y uso de biofungicidas.",
            climateRecommendation: "La combinación de alta humedad y calor puede propagar el tizón; es importante aplicar fungicidas y evitar exceso de riego.")
        )
    ],
    "Wheat_Brown_Rust": [
        (temperaturaRange: 15...22, humedadRange: 70...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Roya marrón en trigo",
            descripcion: "Aparece en condiciones de humedad alta, formando pústulas marrones en las hojas.",
            recomendacion: "Evitar plantaciones tardías y aplicar fungicidas en condiciones favorables.",
            recomendacionEcologica: "Implementar cultivos de cobertura que supriman patógenos y aumenten biodiversidad.",
            climateRecommendation: "La roya marrón prospera en clima húmedo; se recomienda reforzar las prácticas de control en condiciones favorables.")
        )
    ],
    "Wheat_Common_Root_Rot": [
        (temperaturaRange: 15...22, humedadRange: -1000...60, recomendacion: Recomendacion(
            descripcionEnfermedad: "Pudrición común de la raíz en trigo",
            descripcion: "Enfermedad causada por hongos del suelo que afecta las raíces, provocando un crecimiento atrofiado.",
            recomendacion: "Rotación de cultivos, buen drenaje y evitar estrés hídrico.",
            recomendacionEcologica: "Compostaje y prácticas de laboreo mínimo para mantener el equilibrio microbiano.",
            climateRecommendation: "Las condiciones húmedas del suelo aumentan el riesgo de pudrición; se recomienda asegurar un drenaje adecuado.")
        )
    ],
    "Wheat_Fusarium_Head_Blight": [
        (temperaturaRange: 25...30, humedadRange: 60...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Fusariosis de la espiga en trigo",
            descripcion: "Infección fúngica que causa espigas decoloradas y granos podridos.",
            recomendacion: "Aplicar fungicidas en floración y usar variedades resistentes.",
            recomendacionEcologica: "Manejo de residuos de cultivos y uso de control biológico de hongos.",
            climateRecommendation: "El clima cálido y húmedo favorece la fusariosis; es importante aplicar fungicidas al inicio de los síntomas.")
        )
    ],
    "Wheat_Healthy": [
        (temperaturaRange: -1000...Double.greatestFiniteMagnitude, humedadRange: -10000...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Trigo saludable",
            descripcion: "Estado del trigo con bajo riesgo de enfermedades, con condiciones ambientales balanceadas.",
            recomendacion: "Monitorear condiciones ambientales para evitar exceso de humedad.",
            recomendacionEcologica: "Aplicar riego controlado y mejorar estructura del suelo con abono orgánico.",
            climateRecommendation: "Mantener las condiciones climáticas balanceadas ayuda a prevenir enfermedades en el trigo.")
        )
    ],
    "Wheat_Leaf_Blight": [
        (temperaturaRange: 25...30, humedadRange: 60...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Tizón de la hoja en trigo",
            descripcion: "Enfermedad que causa manchas marrones en las hojas, afectando la fotosíntesis.",
            recomendacion: "Aplicar fungicidas temprano y rotar cultivos.",
            recomendacionEcologica: "Controlar fertilizantes nitrogenados y usar biofungicidas.",
            climateRecommendation: "Condiciones húmedas y cálidas favorecen el tizón; aplicar fungicidas preventivos y evitar densidad alta de siembra.")
        )
    ],
    "Wheat_Mildew": [
        (temperaturaRange: 15...20, humedadRange: 60...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Mildiu en trigo",
            descripcion: "Infección fúngica que produce moho blanco en las hojas, reduciendo el vigor de la planta.",
            recomendacion: "Aplicar fungicidas y usar cultivares resistentes.",
            recomendacionEcologica: "Fomentar la circulación del aire y aplicar biofertilizantes.",
            climateRecommendation: "El clima fresco y húmedo puede intensificar el mildiu; se recomienda mejorar la ventilación y aplicar fungicidas específicos.")
        )
    ],
    "Wheat_Mite": [
        (temperaturaRange: 25...30, humedadRange: -10000...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Ácaro en trigo",
            descripcion: "Infestación de ácaros que debilita la planta y reduce la producción.",
            recomendacion: "Control de poblaciones de ácaros mediante prácticas de riego.",
            recomendacionEcologica: "Usar aceites vegetales o extractos naturales para control ecológico.",
            climateRecommendation: "Clima cálido y seco favorece la propagación de ácaros; aumentar la humedad del campo puede reducir infestaciones.")
        )
    ],
    "Wheat_Septoria": [
        (temperaturaRange: 15...20, humedadRange: 60...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Septoria en trigo",
            descripcion: "Causa manchas marrones y afecta la fotosíntesis.",
            recomendacion: "Tratamientos con fungicidas en clima húmedo.",
            recomendacionEcologica: "Poda selectiva y manejo para mejorar ventilación.",
            climateRecommendation: "La septoria prospera en condiciones húmedas y frescas; incrementar la ventilación y aplicar fungicidas preventivos.")
        )
    ],
    "Wheat_Smut": [
        (temperaturaRange: -1000...Double.greatestFiniteMagnitude, humedadRange: 60...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Carbón en trigo",
            descripcion: "Infección de hongo que transforma las semillas en esporas negras.",
            recomendacion: "Tratamiento de semillas para reducir riesgo de infección.",
            recomendacionEcologica: "Usar variedades resistentes y aplicar bioinoculantes.",
            climateRecommendation: "El ambiente húmedo favorece el desarrollo de carbón; priorizar el tratamiento de semillas.")
        )
    ],
    "Wheat_Stem_Fly": [
        (temperaturaRange: 20...Double.greatestFiniteMagnitude, humedadRange: -10000...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Mosca del tallo en trigo",
            descripcion: "Plaga de insecto cuyas larvas se alimentan dentro del tallo, debilitando la estructura.",
            recomendacion: "Rotación de cultivos y ajuste en época de siembra.",
            recomendacionEcologica: "Control biológico con depredadores naturales.",
            climateRecommendation: "Temperaturas elevadas aumentan el riesgo de infestación de mosca del tallo; ajustar época de siembra y considerar control biológico.")
        )
    ],
    "Wheat_Tan_Spot": [
        (temperaturaRange: 15...25, humedadRange: -10000...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Mancha bronceada en trigo",
            descripcion: "Enfermedad fúngica que causa manchas marrones en las hojas.",
            recomendacion: "Evitar el cultivo continuo de trigo y usar variedades resistentes.",
            recomendacionEcologica: "Aplicar microorganismos benéficos y diversificar cultivos.",
            climateRecommendation: "El clima templado favorece la mancha bronceada; realizar rotación de cultivos y monitorear el área.")
        )
    ],
    "Bean_Anthracnose": [
        (temperaturaRange: 13...26, humedadRange: 92...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Antracnosis en frijol",
            descripcion: "Infección fúngica causada por Colletotrichum lindemuthianum, que produce lesiones en hojas, tallos y vainas.",
            recomendacion: "Usa semillas certificadas y práctica la rotación de cultivos.",
            recomendacionEcologica: "Rotación de cultivos y semillas certificadas.",
            climateRecommendation: "Las condiciones actuales favorecen la antracnosis; evite manipulación de plantas húmedas y use fungicidas preventivos.")
        )
    ],
    "Bean_Rust": [
        (temperaturaRange: 18...25, humedadRange: 85...100, recomendacion: Recomendacion(
            descripcionEnfermedad: "Roya en frijol",
            descripcion: "Enfermedad causada por el hongo Uromyces appendiculatus, que forma pústulas anaranjadas en la superficie de las hojas.",
            recomendacion: "Practica la rotación de cultivos y elige variedades de frijol resistentes a la enfermedad.",
            recomendacionEcologica: "Rotación de cultivos y evitar el riego por aspersión para reducir la humedad en las hojas.",
            climateRecommendation: "El clima húmedo favorece la roya en frijol; aplicar fungicidas preventivos y limitar riego por aspersión.")
        )
    ],
    "Bean_Healthy": [
        (temperaturaRange: -1000...Double.greatestFiniteMagnitude, humedadRange: -10000...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Frijol saludable",
            descripcion: "Estado saludable del frijol con bajo riesgo de enfermedades.",
            recomendacion: "Controla la humedad del suelo para evitar el exceso de humedad o el estrés hídrico.",
            recomendacionEcologica: "Buena ventilación y drenaje ayudan a reducir vulnerabilidad a enfermedades.",
            climateRecommendation: "Mantener un ambiente adecuado reduce el riesgo de enfermedades en frijoles.")
        )
    ],
    "Pumpkin_Bacterial_Leaf_Spot": [
        (temperaturaRange: 24...30, humedadRange: 80...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Mancha bacteriana en hojas de calabaza",
            descripcion: "Enfermedad bacteriana causada por Xanthomonas campestris, que provoca manchas en las hojas.",
            recomendacion: "Evitar el riego por aspersión y asegurar buena circulación de aire.",
            recomendacionEcologica: "Evitar el riego por aspersión y promover buena ventilación para reducir la humedad.",
            climateRecommendation: "El clima cálido y húmedo puede propiciar la mancha bacteriana; reducir la humedad alrededor del cultivo.")
        )
    ],
    "Pumpkin_Downey_Mildew": [
        (temperaturaRange: 18...25, humedadRange: 70...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Mildiu velloso en calabaza",
            descripcion: "Infección fúngica causada por Pseudoperonospora cubensis, que afecta hojas y tallos.",
            recomendacion: "Aplicar fungicidas preventivos en condiciones húmedas y cálidas.",
            recomendacionEcologica: "Aplicar control biológico mediante fungicidas naturales y eliminar hojas infectadas.",
            climateRecommendation: "El clima cálido y húmedo favorece el mildiu; aplicar fungicidas preventivos y eliminar hojas infectadas.")
        )
    ],
    "Pumpkin_Leaf_Curl_Disease": [
        (temperaturaRange: 25...Double.greatestFiniteMagnitude, humedadRange: 70...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Enfermedad de enrollamiento de hojas en calabaza",
            descripcion: "Enfermedad viral transmitida por insectos, que causa deformaciones en las hojas y reduce el crecimiento.",
            recomendacion: "Controlar la humedad excesiva y usar variedades resistentes al virus.",
            recomendacionEcologica: "Control biológico de vectores (como áfidos) y uso de cultivos de cobertura.",
            climateRecommendation: "El clima cálido y húmedo favorece esta enfermedad viral; mejorar la ventilación y aplicar controles preventivos.")
        )
    ],
    "Pumpkin_Mosaic_Disease": [
        (temperaturaRange: 15...25, humedadRange: -10000...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Enfermedad del mosaico en calabaza",
            descripcion: "Causada por virus transmitidos por áfidos, provoca manchas y deformaciones en las hojas.",
            recomendacion: "Evitar infestación de áfidos, control de plagas y eliminación de plantas infectadas.",
            recomendacionEcologica: "Usar semillas libres de virus y mantener control de plagas para prevenir la transmisión.",
            climateRecommendation: "Condiciones frescas favorecen la enfermedad del mosaico; usar barreras físicas y controlar vectores.")
        )
    ],
    "Pumpkin_Powdery_Mildew": [
        (temperaturaRange: 18...24, humedadRange: 60...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Mildiu polvoriento en calabaza",
            descripcion: "Infección causada por hongos como Erysiphe cichoracearum, que forma un moho blanco en las hojas.",
            recomendacion: "Aplicar fungicidas específicos y proporcionar buena ventilación.",
            recomendacionEcologica: "Aplicar biofungicidas y mejorar la ventilación para reducir la humedad en las plantas.",
            climateRecommendation: "Condiciones cálidas y secas pueden intensificar el mildiu; mantener baja la humedad en las plantas.")
        )
    ],
    "Pumpkin_Red_Beetle": [
        (temperaturaRange: 20...Double.greatestFiniteMagnitude, humedadRange: 50...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Escarabajo rojo en calabaza",
            descripcion: "Insecto plaga que se alimenta de las hojas, causando daños extensivos.",
            recomendacion: "Aplicación de insecticidas y monitoreo constante de los cultivos.",
            recomendacionEcologica: "Monitoreo constante y uso de trampas para capturar escarabajos.",
            climateRecommendation: "Clima cálido y seco puede aumentar la infestación de escarabajos; usar trampas y controlar manualmente.")
        )
    ],
    "Pumpkin_Healthy": [
        (temperaturaRange: -100000...Double.greatestFiniteMagnitude, humedadRange: 0...Double.greatestFiniteMagnitude, recomendacion: Recomendacion(
            descripcionEnfermedad: "Calabaza saludable",
            descripcion: "Estado saludable de calabaza, baja posibilidad enfermedades",
            recomendacion: "Mantén un control adecuado de la humedad y la circulación del aire para prevenir el desarrollo de enfermedades fúngicas. El uso de variedades resistentes también puede ayudar a mejorar la salud general del cultivo.",
            recomendacionEcologica: "Uso de cocteles de vitaminas.",
            climateRecommendation: "Mantener un ambiente adecuado reduce el riesgo de enfermedades en calabazas.")
        )
    ]
]

// Recomendaciones genéricas por especie
//
//
//
//
let recomendacionesGenericas: [String: Recomendacion] = [
    "Wheat_Yellow_Rust": Recomendacion(
        descripcionEnfermedad: "Roya amarilla en trigo",
        descripcion: "Enfermedad fúngica que causa pústulas amarillas en las hojas, afectando la fotosíntesis y el crecimiento.",
        recomendacion: "Aplicar tratamientos tempranos con insecticidas para controlar áfidos y reducir riego excesivo.",
        recomendacionEcologica: "Rotación de cultivos y uso de variedades resistentes para disminuir incidencia.",
        climateRecommendation: "El clima actual es favorable para reducir el riesgo de roya amarilla en el trigo."
    ),
    "Wheat_Yellow_Rust_Cool": Recomendacion(
        descripcionEnfermedad: "Roya amarilla en clima frío",
        descripcion: "Variante de roya amarilla que prospera en climas frescos, causando pústulas en las hojas.",
        recomendacion: "Plantar variedades resistentes, usar fungicidas según sea necesario y monitorear condiciones frías.",
        recomendacionEcologica: "Mantener un control de humedad adecuado y fomentar el uso de variedades tolerantes.",
        climateRecommendation: "El clima actual es favorable para el cultivo de trigo, reduciendo la posibilidad de roya amarilla."
    ),
    "Wheat_Black_Rust": Recomendacion(
        descripcionEnfermedad: "Roya negra en trigo",
        descripcion: "Causada por el hongo Puccinia graminis, produce pústulas oscuras en hojas y tallos.",
        recomendacion: "Aplicar fungicidas en condiciones favorables y utilizar variedades resistentes.",
        recomendacionEcologica: "Rotación de cultivos y manejo adecuado del suelo para mejorar resistencia.",
        climateRecommendation: "Las condiciones actuales benefician la salud del trigo y reducen la posibilidad de roya negra."
    ),
    "Wheat_Blast": Recomendacion(
        descripcionEnfermedad: "Tizón en trigo",
        descripcion: "Enfermedad causada por Magnaporthe oryzae, afecta la espiga y produce lesiones marrones.",
        recomendacion: "Evitar plantaciones tardías y aplicar fungicidas en condiciones favorables.",
        recomendacionEcologica: "Rotación con cultivos no hospedantes y uso de biofungicidas.",
        climateRecommendation: "El clima actual es favorable para reducir el riesgo de tizón en el trigo."
    ),
    "Wheat_Brown_Rust": Recomendacion(
        descripcionEnfermedad: "Roya marrón en trigo",
        descripcion: "Aparece en condiciones de humedad alta, formando pústulas marrones en las hojas.",
        recomendacion: "Evitar plantaciones tardías y aplicar fungicidas en condiciones favorables.",
        recomendacionEcologica: "Implementar cultivos de cobertura que supriman patógenos y aumenten biodiversidad.",
        climateRecommendation: "Las condiciones climáticas actuales son favorables para disminuir la incidencia de roya marrón."
    ),
    "Wheat_Common_Root_Rot": Recomendacion(
        descripcionEnfermedad: "Pudrición común de la raíz en trigo",
        descripcion: "Enfermedad causada por hongos del suelo que afecta las raíces, provocando un crecimiento atrofiado.",
        recomendacion: "Rotación de cultivos, buen drenaje y evitar estrés hídrico.",
        recomendacionEcologica: "Compostaje y prácticas de laboreo mínimo para mantener el equilibrio microbiano.",
        climateRecommendation: "El clima actual es favorable para reducir el riesgo de pudrición en las raíces del trigo."
    ),
    "Wheat_Fusarium_Head_Blight": Recomendacion(
        descripcionEnfermedad: "Fusariosis de la espiga en trigo",
        descripcion: "Infección fúngica que causa espigas decoloradas y granos podridos.",
        recomendacion: "Aplicar fungicidas en floración y usar variedades resistentes.",
        recomendacionEcologica: "Manejo de residuos de cultivos y uso de control biológico de hongos.",
        climateRecommendation: "El clima actual reduce la probabilidad de fusariosis en espigas de trigo."
    ),
    "Wheat_Healthy": Recomendacion(
        descripcionEnfermedad: "Trigo saludable",
        descripcion: "Estado del trigo con bajo riesgo de enfermedades, con condiciones ambientales balanceadas.",
        recomendacion: "Monitorear condiciones ambientales para evitar exceso de humedad.",
        recomendacionEcologica: "Aplicar riego controlado y mejorar estructura del suelo con abono orgánico.",
        climateRecommendation: "Mantener las condiciones climáticas balanceadas ayuda a prevenir enfermedades en el trigo."
    ),
    "Wheat_Leaf_Blight": Recomendacion(
        descripcionEnfermedad: "Tizón de la hoja en trigo",
        descripcion: "Enfermedad que causa manchas marrones en las hojas, afectando la fotosíntesis.",
        recomendacion: "Aplicar fungicidas temprano y rotar cultivos.",
        recomendacionEcologica: "Controlar fertilizantes nitrogenados y usar biofungicidas.",
        climateRecommendation: "El clima actual es favorable y reduce el riesgo de tizón en hojas de trigo."
    ),
    "Wheat_Mildew": Recomendacion(
        descripcionEnfermedad: "Mildiu en trigo",
        descripcion: "Infección fúngica que produce moho blanco en las hojas, reduciendo el vigor de la planta.",
        recomendacion: "Aplicar fungicidas y usar cultivares resistentes.",
        recomendacionEcologica: "Fomentar la circulación del aire y aplicar biofertilizantes.",
        climateRecommendation: "Condiciones actuales benefician la resistencia del trigo frente al mildiu."
    ),
    "Wheat_Mite": Recomendacion(
        descripcionEnfermedad: "Ácaro en trigo",
        descripcion: "Infestación de ácaros que debilita la planta y reduce la producción.",
        recomendacion: "Control de poblaciones de ácaros mediante prácticas de riego.",
        recomendacionEcologica: "Usar aceites vegetales o extractos naturales para control ecológico.",
        climateRecommendation: "Clima actual es favorable y puede reducir las poblaciones de ácaros en trigo."
    ),
    "Wheat_Septoria": Recomendacion(
        descripcionEnfermedad: "Septoria en trigo",
        descripcion: "Causa manchas marrones y afecta la fotosíntesis.",
        recomendacion: "Tratamientos con fungicidas en clima húmedo.",
        recomendacionEcologica: "Poda selectiva y manejo para mejorar ventilación.",
        climateRecommendation: "Condiciones actuales ayudan a reducir el riesgo de septoria en trigo."
    ),
    "Wheat_Smut": Recomendacion(
        descripcionEnfermedad: "Carbón en trigo",
        descripcion: "Infección de hongo que transforma las semillas en esporas negras.",
        recomendacion: "Tratamiento de semillas para reducir riesgo de infección.",
        recomendacionEcologica: "Usar variedades resistentes y aplicar bioinoculantes.",
        climateRecommendation: "El ambiente húmedo favorece el desarrollo de carbón; priorizar el tratamiento de semillas."
    ),
    "Wheat_Stem_Fly": Recomendacion(
        descripcionEnfermedad: "Mosca del tallo en trigo",
        descripcion: "Plaga de insecto cuyas larvas se alimentan dentro del tallo, debilitando la estructura.",
        recomendacion: "Rotación de cultivos y ajuste en época de siembra.",
        recomendacionEcologica: "Control biológico con depredadores naturales.",
        climateRecommendation: "Temperaturas elevadas aumentan el riesgo de infestación de mosca del tallo; ajustar época de siembra y considerar control biológico."
    ),
    "Wheat_Tan_Spot": Recomendacion(
        descripcionEnfermedad: "Mancha bronceada en trigo",
        descripcion: "Enfermedad fúngica que causa manchas marrones en las hojas.",
        recomendacion: "Evitar el cultivo continuo de trigo y usar variedades resistentes.",
        recomendacionEcologica: "Aplicar microorganismos benéficos y diversificar cultivos.",
        climateRecommendation: "El clima templado favorece la mancha bronceada; realizar rotación de cultivos y monitorear el área."
    ),
    "Bean_Anthracnose": Recomendacion(
        descripcionEnfermedad: "Antracnosis en frijol",
        descripcion: "Infección fúngica causada por Colletotrichum lindemuthianum, que produce lesiones en hojas, tallos y vainas.",
        recomendacion: "Usa semillas certificadas y practica la rotación de cultivos.",
        recomendacionEcologica: "Rotación de cultivos y uso de semillas certificadas para prevenir la propagación.",
        climateRecommendation: "El clima actual es favorable para un cultivo saludable de frijol, reduciendo el riesgo de antracnosis."
    ),
    "Bean_Rust": Recomendacion(
        descripcionEnfermedad: "Roya en frijol",
        descripcion: "Enfermedad causada por el hongo Uromyces appendiculatus, que forma pústulas anaranjadas en la superficie de las hojas.",
        recomendacion: "Practica la rotación de cultivos y elige variedades de frijol resistentes a la enfermedad.",
        recomendacionEcologica: "Rotación de cultivos y evitar el riego por aspersión para reducir la humedad en las hojas.",
        climateRecommendation: "El clima actual beneficia la salud del frijol y ayuda a prevenir la roya."
    ),
    "Pumpkin_Bacterial_Leaf_Spot": Recomendacion(
        descripcionEnfermedad: "Mancha bacteriana en hojas de calabaza",
        descripcion: "Enfermedad bacteriana que provoca manchas en las hojas, afectando la fotosíntesis.",
        recomendacion: "Evitar el riego por aspersión y asegurar buena ventilación.",
        recomendacionEcologica: "Evitar el riego por aspersión y promover buena ventilación para reducir la humedad.",
        climateRecommendation: "El clima actual favorece la resistencia de la calabaza a la mancha bacteriana."
    ),
    "Pumpkin_Downey_Mildew":
        Recomendacion(
            descripcionEnfermedad: "Mildiu velloso en calabaza",
            descripcion: "Infección fúngica causada por Pseudoperonospora cubensis, que afecta hojas y tallos.",
            recomendacion: "Aplicar fungicidas preventivos en condiciones húmedas y cálidas.",
            recomendacionEcologica: "Aplicar control biológico mediante fungicidas naturales y eliminar hojas infectadas.",
            climateRecommendation: "El clima cálido y húmedo favorece el mildiu; aplicar fungicidas preventivos y eliminar hojas infectadas.")
    ,
    "Pumpkin_Leaf_Curl_Disease":
        Recomendacion(
            descripcionEnfermedad: "Enfermedad de enrollamiento de hojas en calabaza",
            descripcion: "Enfermedad viral transmitida por insectos, que causa deformaciones en las hojas y reduce el crecimiento.",
            recomendacion: "Controlar la humedad excesiva y usar variedades resistentes al virus.",
            recomendacionEcologica: "Control biológico de vectores (como áfidos) y uso de cultivos de cobertura.",
            climateRecommendation: "El clima cálido y húmedo favorece esta enfermedad viral; mejorar la ventilación y aplicar controles preventivos.")
    ,
    
    "Pumpkin_Mosaic_Disease": Recomendacion(
        descripcionEnfermedad: "Enfermedad del mosaico en calabaza",
        descripcion: "Causada por virus transmitidos por áfidos, provoca manchas y deformaciones en las hojas.",
        recomendacion: "Evitar infestación de áfidos, control de plagas y eliminación de plantas infectadas.",
        recomendacionEcologica: "Usar semillas libres de virus y mantener control de plagas para prevenir la transmisión.",
        climateRecommendation: "El clima es favorable para un cultivo saludable de calabaza, disminuyendo el riesgo de mosaico."
    ),
    "Pumpkin_Powdery_Mildew":
        Recomendacion(
            descripcionEnfermedad: "Mildiu polvoriento en calabaza",
            descripcion: "Infección causada por hongos como Erysiphe cichoracearum, que forma un moho blanco en las hojas.",
            recomendacion: "Aplicar fungicidas específicos y proporcionar buena ventilación.",
            recomendacionEcologica: "Aplicar biofungicidas y mejorar la ventilación para reducir la humedad en las plantas.",
            climateRecommendation: "Condiciones cálidas y secas pueden intensificar el mildiu; mantener baja la humedad en las plantas.")
    ,
    "Pumpkin_Red_Beetle": Recomendacion(
        descripcionEnfermedad: "Escarabajo rojo en calabaza",
        descripcion: "Insecto plaga que se alimenta de las hojas, causando daños extensivos.",
        recomendacion: "Aplicación de insecticidas y monitoreo constante de los cultivos.",
        recomendacionEcologica: "Monitoreo constante y uso de trampas para capturar escarabajos.",
        climateRecommendation: "El clima actual ayuda a reducir el riesgo de infestación de escarabajos en calabaza."
    ),
    "Pumpkin_Healthy":
        Recomendacion(
            descripcionEnfermedad: "Calabaza saludable",
            descripcion: "Estado saludable de calabaza, baja posibilidad enfermedades",
            recomendacion: "Mantén un control adecuado de la humedad y la circulación del aire para prevenir el desarrollo de enfermedades fúngicas. El uso de variedades resistentes también puede ayudar a mejorar la salud general del cultivo.",
            recomendacionEcologica: "Uso de cocteles de vitaminas.",
            climateRecommendation: "Mantener un ambiente adecuado reduce el riesgo de enfermedades en calabazas.")
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
