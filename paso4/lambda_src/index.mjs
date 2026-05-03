export const handler = async (event) => {
  console.log("Evento recibido:", JSON.stringify(event));
  return {
    statusCode: 200,
    body: JSON.stringify({ mensaje: "OK" })
  };
};
