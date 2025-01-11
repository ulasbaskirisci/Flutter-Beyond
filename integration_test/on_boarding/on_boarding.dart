import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutterankara_2/presentation/on_boarding/on_boarding.dart';

void main() {
  // IntegrationTestWidgetsFlutterBinding, entegrasyon testlerini başlatır.
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('OnboardingPage Integration Test', () {
    // Onboarding akışını test eden ana test grubu
    testWidgets('Onboarding flow test', (WidgetTester tester) async {
      // 1. Uygulamayı başlat
      // OnboardingPage widget'ını bir MaterialApp içinde başlatıyoruz.
      await tester.pumpWidget(MaterialApp(
        home: OnboardingPage(
          onThemeChanged: (_) {}, // Tema değişikliği için bir placeholder işlev
        ),
      ));
      await tester.pumpAndSettle(); // Widget'ın tamamen yüklenmesini bekle

      // 2. İlk onboarding sayfasını doğrula
      // İlk sayfanın başlığını ve açıklamasını kontrol ediyoruz.
      expect(find.text("Hoş Geldiniz"), findsOneWidget); // Başlığı kontrol et
      expect(find.text("Uygulamanın özelliklerini keşfedin."),
          findsOneWidget); // Açıklamayı kontrol et

      // 3. "Sonraki" butonuna tıkla
      await tester
          .tap(find.byIcon(Icons.arrow_forward)); // İleri butonuna tıkla
      await tester.pumpAndSettle(); // Ekranın yenilenmesini bekle

      // 4. İkinci onboarding sayfasını doğrula
      // İkinci sayfanın başlığı ve açıklamasının doğru olduğunu kontrol ediyoruz.
      expect(find.text("Kolay Kullanım"),
          findsOneWidget); // İkinci başlığı kontrol et
      expect(find.text("Hızlı ve basit bir deneyim yaşayın."),
          findsOneWidget); // İkinci açıklamayı kontrol et

      // 5. "Tamam" butonuna tıkla
      await tester.tap(find.text("Tamam")); // "Tamam" butonuna tıkla
      await tester.pumpAndSettle(); // Navigasyonun tamamlanmasını bekle

      // 6. MyHomePage'e navigasyon doğrulaması
      // Navigasyonun başarıyla MyHomePage'e yapıldığını kontrol ediyoruz.
      expect(find.text("Flutter Demo Home Page"),
          findsOneWidget); // Ana sayfa başlığını kontrol et
    });
  });
}
