export async function onRequestPost(context) {
  const { PAYPAL_CLIENT_ID, PAYPAL_CLIENT_SECRET } = context.env;

  const auth = btoa(`${PAYPAL_CLIENT_ID}:${PAYPAL_CLIENT_SECRET}`);
  const tokenResp = await fetch('https://api-m.paypal.com/v1/oauth2/token', {
    method: 'POST',
    headers: {
      'Authorization': `Basic ${auth}`,
      'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: 'grant_type=client_credentials'
  });
  const { access_token } = await tokenResp.json();

  const orderResp = await fetch('https://api-m.paypal.com/v2/checkout/orders', {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${access_token}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      intent: 'CAPTURE',
      purchase_units: [{ amount: { currency_code: 'CAD', value: '10.00' } }]
    })
  });

  const order = await orderResp.json();
  return new Response(JSON.stringify(order), {
    headers: { 'Content-Type': 'application/json' }
  });
}
